Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A610481217
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 12:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbhL2LoY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Dec 2021 06:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235407AbhL2LoY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 06:44:24 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AD7C061574;
        Wed, 29 Dec 2021 03:44:24 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id i8so9784469pgt.13;
        Wed, 29 Dec 2021 03:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rG+Cf3dfeI4bUhMVKBD040dx5Rx203pYNLQ9gUYRaHU=;
        b=nglXNw2WmVfaDDDvGzWmKD2fHJJcJJFKJr0JmVX+WNyHdtprDhtt/rDh9Z5T1+Dhm+
         P7x+BA8nn1RpJ4ia/zP+fzJIWNHo1DtSdsLIJQcAGUpbSdhB+YmrXNCw1vH3sR0rXik+
         dLFmP4SCpCAr4XIncukRrac9+UovWwmIMGjKaTbfOcNdpzrFXuLv4d/7uW3OsBPzjngN
         jWjmUD0Tf14TA4gVXXTRCe4QNGSISRaRXJiN6KPmD9nFsigdrYHrQiRfc8AOiaJf4x6n
         +D7mrR1EIpaANwG4nHzvQoRYzcpxFCzHk09yxJKeaFZq05CsQQTGVvCYPAqsK38RAyzV
         l3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rG+Cf3dfeI4bUhMVKBD040dx5Rx203pYNLQ9gUYRaHU=;
        b=OywSqkGWcz4E9fPO/AMJsiCW422DWfCffbY1kQbbDZinj4JlVnceuPdc9NQMtb6Htj
         okSfd+lq5RMw0gJarAkYFjrfv8aRb3oGj1IMdyE0s+RG67/FdyFMjALKd/d6Y+4yucwJ
         8A71h5VBDlGyCvOeitOZFjcPvfTRmtxWF+UpdZ85XJN1eTeshGPey8vyqRnmn9Ehnk7K
         huqOqP9KnVjc40uRTHRZrbtU1Wq4FmoM3xhA6+MX0oX3DGg0E6LwVElji48DCxnUZ1ec
         TiEPLrOEcYB6gdHfppn0xaFmtcv5MPtpkCTRTHJ3HoNMl1rW4GTBKGvSKqyx35Rx6jy2
         K/zg==
X-Gm-Message-State: AOAM531hFjo4hGSxaTKZ7pIL2yRrtO2JylJv9feqRDDihRtWcTDEAoaQ
        fTX4BIiYWB0KH8WYYRueCnc=
X-Google-Smtp-Source: ABdhPJwiSTnNNKS4HM+p6/pxmNnfDsZP8ytANjUaLZCJetHNLTHErHaNDcFCAmTuAzBZS4jV0WzKoA==
X-Received: by 2002:a62:7b8a:0:b0:4ba:baf8:9c54 with SMTP id w132-20020a627b8a000000b004babaf89c54mr26179213pfc.10.1640778263765;
        Wed, 29 Dec 2021 03:44:23 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id bg23sm22012058pjb.24.2021.12.29.03.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 03:44:23 -0800 (PST)
Subject: [PATCH v2 1/4] docs: sphinx/kfigure.py: Use rsvg-convert(1) for DOT
 -> PDF conversion
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e01fe9f9-f600-c2fc-c6b3-ef6395655ffe@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <15b56dd3-081a-2469-c3a4-dfc1ca4c6c2d@gmail.com>
Date:   Wed, 29 Dec 2021 20:44:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e01fe9f9-f600-c2fc-c6b3-ef6395655ffe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On openSUSE, dot(1) command does not support direct PDF output.
On other distros, generated PDF images have unnecessarily wide margins,
especially for small graphs.

By using dot(1) for DOT -> SVG, then rsvg-convert(1) for SVG -> PDF,
more optimal PDF images can be obtained, with the bonus of improved
portability across various distros.

Add rules in kfigure.py so that the above mentioned route is taken
when rsvg-convert(1) is available.

Note that rsvg-convert(1) is recommended by sphinx_pre_install.
So it is most likely that existing systems for building pdfdocs have
rsvg-convert(1) installed.

Note:
    SVG features supported by rsvg-convert(1) vary depending on its
    version and distro config.
    For example, the one found on Ubuntu Bionic (version 2.40.20) does
    poor job in rendering some of SVG files drawn by Inkscape.
    SVG files generated by dot(1) are converted nicely even with such
    old versions of rsvg-convert.

    So this change does not affect the quality of such figures in any
    way.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 Documentation/sphinx/kfigure.py | 46 +++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 3c78828330be..955e3ec5de5a 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -31,6 +31,8 @@ u"""
 
     * ``dot(1)``: Graphviz (https://www.graphviz.org). If Graphviz is not
       available, the DOT language is inserted as literal-block.
+      For conversion to PDF, ``rsvg-convert(1)`` of librsvg
+      (https://gitlab.gnome.org/GNOME/librsvg) is used when available.
 
     * SVG to PDF: To generate PDF, you need at least one of this tools:
 
@@ -113,6 +115,9 @@ dot_cmd = None
 # ImageMagick' convert(1) support
 convert_cmd = None
 
+# librsvg's rsvg-convert(1) support
+rsvg_convert_cmd = None
+
 
 def setup(app):
     # check toolchain first
@@ -160,11 +165,12 @@ def setupTools(app):
 
     This function is called once, when the builder is initiated.
     """
-    global dot_cmd, convert_cmd   # pylint: disable=W0603
+    global dot_cmd, convert_cmd, rsvg_convert_cmd   # pylint: disable=W0603
     kernellog.verbose(app, "kfigure: check installed tools ...")
 
     dot_cmd = which('dot')
     convert_cmd = which('convert')
+    rsvg_convert_cmd = which('rsvg-convert')
 
     if dot_cmd:
         kernellog.verbose(app, "use dot(1) from: " + dot_cmd)
@@ -177,6 +183,11 @@ def setupTools(app):
         kernellog.warn(app,
             "convert(1) not found, for SVG to PDF conversion install "
             "ImageMagick (https://www.imagemagick.org)")
+    if rsvg_convert_cmd:
+        kernellog.verbose(app, "use rsvg-convert(1) from: " + rsvg_convert_cmd)
+    else:
+        kernellog.verbose(app, "rsvg-convert(1) not found, "
+                          "falling back to raster image conversion")
 
 
 # integrate conversion tools
@@ -266,7 +277,13 @@ def convert_image(img_node, translator, src_fname=None):
 
             if in_ext == '.dot':
                 kernellog.verbose(app, 'convert DOT to: {out}/' + _name)
-                ok = dot2format(app, src_fname, dst_fname)
+                if translator.builder.format == 'latex':
+                    svg_fname = path.join(translator.builder.outdir, fname + '.svg')
+                    ok1 = dot2format(app, src_fname, svg_fname)
+                    ok2 = svg2pdf_by_rsvg(app, svg_fname, dst_fname)
+                    ok = ok1 and ok2
+                else:
+                    ok = dot2format(app, src_fname, dst_fname)
 
             elif in_ext == '.svg':
                 kernellog.verbose(app, 'convert SVG to: {out}/' + _name)
@@ -319,6 +336,31 @@ def svg2pdf(app, svg_fname, pdf_fname):
         kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
     return bool(exit_code == 0)
 
+def svg2pdf_by_rsvg(app, svg_fname, pdf_fname):
+    """Convert SVG to PDF with ``rsvg-convert(1)`` command.
+
+    * ``svg_fname`` pathname of input SVG file, including extension ``.svg``
+    * ``pdf_fname`` pathname of output PDF file, including extension ``.pdf``
+
+    Input SVG file should be the one generated by ``dot2format()``.
+    SVG -> PDF conversion is done by ``rsvg-convert(1)``.
+
+    If ``rsvg-convert(1)`` is unavailable, fall back to ``svg2pdf()``.
+
+    """
+
+    if rsvg_convert_cmd is None:
+        ok = svg2pdf(app, svg_fname, pdf_fname)
+    else:
+        cmd = [rsvg_convert_cmd, '--format=pdf', '-o', pdf_fname, svg_fname]
+        # use stdout and stderr from parent
+        exit_code = subprocess.call(cmd)
+        if exit_code != 0:
+            kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
+        ok = bool(exit_code == 0)
+
+    return ok
+
 
 # image handling
 # ---------------------
-- 
2.17.1


