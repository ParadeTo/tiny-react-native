export default {
  createRoot(renderDom) {
    RNBridge.send(JSON.stringify({operation: 'createRoot'}))
  },
  createElement(type) {
    return RNBridge.send(JSON.stringify({operation: 'createView', ...type}))
  },
}
