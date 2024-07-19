
import os
from flask import Blueprint, abort, jsonify, request
import requests as req
import json

iib = Blueprint('iib', __name__)


def abort_except(code):
    if code > 200:
        abort(code)


@iib.route('/op4102886v1', methods=['POST'])
def Op4102886v1():
    """Check endpoint handler.
    Args:
        image (str): Base64 encoded image.
    Returns:
        dict: Is picture taken from footage or not.
    """
    r = request.get_json()
    result = req.post(os.environ['SIMILARITY_URL'], json={
        'img1': r['listaImagemReferencia'],
        'img2': r['listaImagemComparativo']
    })

    resultDict = json.loads(result.text)

    response = {
        'codigoRetorno': 200,
        'percentualIndiceSimilaridadeImagem': 0.0,
        'textoMensagemRetorno': '',
        'textoComplementoMensagemRetorno': ''
    }

    if result.status_code != 200:
        response['codigoRetorno'] = result.status_code
        response['textoMensagemRetorno'] = resultDict['message']
        response['textoComplementoMensagemRetorno'] = resultDict['details']
        response['percentualIndiceSimilaridadeImagem'] = -1.0

    if result.status_code == 200:
        response['codigoRetorno'] = result.status_code
        response['textoMensagemRetorno'] = 'Operação realizada com sucesso'
        response['textoComplementoMensagemRetorno'] = ''
        response['percentualIndiceSimilaridadeImagem'] = resultDict['similarity']

    return jsonify(response), 200


@iib.route('/health', methods=['GET'])
def health():
    return "Up", 200
