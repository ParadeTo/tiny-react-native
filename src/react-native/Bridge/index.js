import {View} from '..'

const eleMap = {}
function randomStr(length = 4) {
  var result = []
  var characters =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  var charactersLength = characters.length
  for (var i = 0; i < length; i++) {
    result.push(characters.charAt(Math.floor(Math.random() * charactersLength)))
  }
  return result.join('')
}

export default {
  createRoot(renderDom) {
    const id = 'root'
    RNBridge.send(JSON.stringify({operation: 'createRoot', id: 'root'}))
    return id
  },
  createElement(type, props) {
    let id
    do {
      id = randomStr()
    } while (eleMap[id])
    eleMap[id] = true
    switch (type) {
      case 'View':
        RNBridge.send(JSON.stringify({operation: 'createView', props, id}))
        break
      case 'Text':
        RNBridge.send(JSON.stringify({operation: 'createText', props, id}))
        break
      default:
        break
    }
    return id
  },
  appendChild(parent, child) {
    RNBridge.send(JSON.stringify({operation: 'appendChild', parent, child}))
  },
  update(instance, props) {
    RNBridge.send(JSON.stringify({operation: 'update', instance, props}))
  },
}
