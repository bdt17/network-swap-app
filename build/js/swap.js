window.executeSwap = async function() {
  const swapBtn = document.getElementById('swap-btn');
  const amountInput = document.getElementById('amount');
  
  if (!signer) {
    alert('Please connect wallet first!');
    return;
  }
  
  swapBtn.disabled = true;
  swapBtn.textContent = 'Swapping...';
  
  try {
    const fromToken = document.getElementById('from-token').value || '0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE';
    const toToken = document.getElementById('to-token').value;
    const amount = ethers.parseEther(amountInput.value);
    
    // Get 1inch quote
    const quoteRes = await fetch(`https://api.1inch.dev/swap/v6.0/1/quote?fromTokenAddress=${fromToken}&toTokenAddress=${toToken}&amount=${amount}`);
    const quote = await quoteRes.json();
    
    document.getElementById('quote-output').textContent = 
      `Expected: ${ethers.formatEther(quote.toTokenAmount)} ${toToken.slice(0,6)}`;
    
    alert(`Quote ready! Expected output: ${ethers.formatEther(quote.toTokenAmount)} tokens`);
    
  } catch (error) {
    console.error(error);
    alert('Swap failed: ' + error.message);
  } finally {
    swapBtn.disabled = false;
    swapBtn.textContent = 'Swap Tokens';
  }
};
