let provider = null;
let signer = null;

window.connectWallet = async function() {
  if (!window.ethereum) {
    alert('Please install MetaMask!');
    return null;
  }
  
  try {
    provider = new ethers.BrowserProvider(window.ethereum);
    await provider.send("eth_requestAccounts", []);
    signer = await provider.getSigner();
    
    const address = await signer.getAddress();
    document.getElementById('wallet-address').textContent = 
      `${address.slice(0,6)}...${address.slice(-4)}`;
    document.getElementById('connect-btn').textContent = 'Connected';
    document.getElementById('connect-btn').disabled = true;
    
    return address;
  } catch (error) {
    alert('Connection failed: ' + error.message);
    return null;
  }
};
