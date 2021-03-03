export default {
  createRoot(renderDom) {
    const root = document.createElement('div')
    renderDom.appendChild(root)
    return root
  },
}
