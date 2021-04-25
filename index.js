const animate = () => {
  setTimeout(() => {
    console.log(1)
    animate()
  }, 2000)
}

animate()
