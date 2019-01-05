<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>



 

  <!-- Subhead
================================================== -->
  <section id="subintro">
    <div class="jumbotron subhead" id="overview">
      <div class="container">
        <div class="row">
          <div class="span8">
            <h3><i class="m-icon-big-swapright m-icon-white"></i> Contact us</h3>
            <p>Disputationi comprehensam nam ut eam id accusata explicari minim splendide duo ea dicant.</p>
          </div>
          <div class="span4">
            <div class="input-append">
              <form class="form-search">
                <input type="text" class="input-medium search-query">
                <button type="submit" class="btn btn-inverse">Search</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="maincontent">
    <div class="container">
      <div class="row">
        <div class="span4">
          <aside>
            <div class="widget">
              <h4 class="heading-success"><span class="btn btn-large btn-success"><i class="m-icon-big-swapdown m-icon-white"></i></span>&nbsp;&nbsp;Get in touch with us</h4>
              <ul>
                <li><label><strong>Phone : </strong></label>
                  <p>+808 878 92 0r +808 878 91</p>
                </li>
                <li><label><strong>Email : </strong></label>
                  <p>info@yourdomain.com</p>
                </li>
                <li><label><strong>Adress : </strong></label>
                  <p>Tinggi sekali Tower Jl. Kemacetan timur No.13 Jakarta selatan</p>
                </li>
              </ul>
            </div>
          </aside>
        </div>
        <div class="span8">
          <div class="well">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22864.11283411948!2d-73.96468908098944!3d40.630720240038435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sbg!4v1540447494452" width="100%" height="380" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
          <div class="spacer30"></div>

          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
          <form action="" method="post" role="form" class="contactForm">
            <div class="row">
              <div class="span4 form-group">
                <input type="text" name="name" class="input-block-level" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validation"></div>
              </div>

              <div class="span4 form-group">
                <input type="email" class="input-block-level" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                <div class="validation"></div>
              </div>
              <div class="span8 form-group">
                <input type="text" class="input-block-level" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validation"></div>
              </div>
              <div class="span8 form-group">
                <textarea class="input-block-level" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validation"></div>
                <div style="text-align: center;">
                  <button class="btn btn-medium btn-success" type="submit">Send a message</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>