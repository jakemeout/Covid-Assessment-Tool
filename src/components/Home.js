import React from "react";
import Iframe from "react-iframe";
import styled from "styled-components";

const Home = () => {
  return (
    <HomeStyle className="iframeDash">
      <h1>Welcome to the Covid Travel Risk Assessment Tool!</h1>
      <IntroStyle>
        <h4>
          As you can see below, the travel recommendations from the CDC are
          quite broad. Therefore, we took this as an opportunity to provide more
          granular information about a particular area you are traveling to
          during the COVID-19 pandemic.
        </h4>
        <br />
        <h3>Some Quick Instructions:</h3>
        <div style={{marginLeft: '4%', marginTop: '2%'}}>
        <h4>1. Create an account or login</h4>
        <h4>2. Navigate to the 'Assess a trip' link</h4>
        <h4>3. Enter the destination, and where you are traveling from and hit go!</h4>
        </div>
        <br />
        <h4> Thats it!</h4>
        <div style={{marginLeft: '4%', marginTop: '2%'}}>
        <h4>**Some things to note - This is for the US ONLY, and uses data collected from the New York Times. 
        **NYC is a combined region representing all the 5 boroughs.</h4>
        </div>
      </IntroStyle>
      <Iframe
        width="80%"
        height="80%"
        frameborder="0"
        scrolling="yes"
        marginheight="0"
        marginwidth="0"
        title="COVID-19"
        src="https://www.cdc.gov/coronavirus/2019-ncov/travelers/map-and-travel-notices.html"
      />
    </HomeStyle>
  );
};

const HomeStyle = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 5%;
`;
const IntroStyle = styled.div`
  height: 30%;
  width: 50%;
  margin-top: 2%;
`;
export default Home;
