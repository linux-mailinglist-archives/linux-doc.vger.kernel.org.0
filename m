Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDAC481234
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 12:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhL2LrB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Dec 2021 06:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236301AbhL2LrB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 06:47:01 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F05AC06173E;
        Wed, 29 Dec 2021 03:47:01 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id z9-20020a17090a7b8900b001b13558eadaso24405769pjc.4;
        Wed, 29 Dec 2021 03:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OzcY25P6gwHWgmIgj+/MN+t2PU0tJSyh02aHhqly8XE=;
        b=GioKWfj4eu2kuZYA1ZeC7b21mAfOvkko6ZqQbzA3T+ffgXFxLjaU/kP+kORd6GR+PZ
         m/rCWX2aBx3mjbORfB20HmpW4gjYN4JuvlBgoowAculsv4oSwVX8706r0RpY/jCtSIDt
         7bUQ6ydLWQ5limsUdCzhSd6rVTH+ycFji2a01CBx/SFIgFF1EBrY7ZOc7f9TKjwoH4vf
         OcEUCQgNeltZg4WZAX3AzysrA67tARN1rouSqD3rPRjxr++TmoXaXX8Qip0Ie5bpvHGQ
         aoEjRuWDF4JbAlTS3rPZLy9ZWg6Heel3zejb/Pf4mUxWLqM6ArryJNL8hdO6+JtQHHFC
         R3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OzcY25P6gwHWgmIgj+/MN+t2PU0tJSyh02aHhqly8XE=;
        b=fS3mc7dnndw97NmEybgIcDTXabRpDuAdbQ2IZNRngEK70j6Wucso6mfw+TEnCyy3zI
         QOsH8wcimzouKuW/6WWguiFd+7sGVU2tzfi93cDRloDhB1PiCKvTZDr3+D6ogVNs+JoP
         NBwsfQjsvEZazLSmwUY8MEEDPrTuDT1b8031yyXdJzjKb4q4t2gnu3VoWoaD2byDs+y6
         Ydi+8lLyYz03HTIkOsvLWMVUGJWZz4zZKPTiPFJEKN+HaZKf63MKnxbMsJ3+iIkr4bui
         SfiVRDnNuINCBE2hb1t6nBWi3ENKGqd59krn16RUBF5jqU7F6TvMRGdrH3/a2lSZsEgG
         faYg==
X-Gm-Message-State: AOAM531YKv92X9maRlMZ0HpnHNUFoSRnc+fvgr1oXk/bLjP8dqswezuD
        Gkq8lsO3H63CFp6NZ0a1Hvo=
X-Google-Smtp-Source: ABdhPJzt3VGzawatZBcXvqq/zdpiX8hmBA4yyXnoIUXv63ZmnjVmILrK5zFdntGilmRZuz1O+A+vHg==
X-Received: by 2002:a17:902:70cc:b0:148:aa3a:8c65 with SMTP id l12-20020a17090270cc00b00148aa3a8c65mr25782026plt.114.1640778420922;
        Wed, 29 Dec 2021 03:47:00 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id v1sm23333344pfg.169.2021.12.29.03.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 03:47:00 -0800 (PST)
Subject: [PATCH v2 3/4] docs: sphinx/kfigure.py: Use inkscape(1) for SVG ->
 PDF conversion
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e01fe9f9-f600-c2fc-c6b3-ef6395655ffe@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3eea2a8d-c52d-ee07-cf7b-83784c6f6e4b@gmail.com>
Date:   Wed, 29 Dec 2021 20:46:58 +0900
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

Using convert(1) of ImageMagick for SVG -> PDF conversion results in
PDFs containing raster (bitmap) images which sometimes look blurry.

Ideally speaking, SVG to PDF conversion should retain vector graphics
in SVG.

rsvg-convert(1) can do such conversions with regard to SVG files
generated by dot(1).

Unfortunately, rsvg-convert(1) does not cover some of SVG features
specific to Inkscape.
inkscape(1) of Inkscape naturally covers such SVG features.

So add a route in svg2pdf() so that inkscape(1) is used when it is
available.

Note:
    After this change, if you have Inkscape installed, ImageMagick nor
    librsvg are not required.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 Documentation/sphinx/kfigure.py | 68 +++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 77b0d15dba31..e616e49669eb 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -37,6 +37,7 @@ u"""
     * SVG to PDF: To generate PDF, you need at least one of this tools:
 
       - ``convert(1)``: ImageMagick (https://www.imagemagick.org)
+      - ``inkscape(1)``: Inkscape (https://inkscape.org/)
 
     List of customizations:
 
@@ -121,6 +122,11 @@ convert_cmd = None
 # librsvg's rsvg-convert(1) support
 rsvg_convert_cmd = None
 
+# Inkscape's inkscape(1) support
+inkscape_cmd = None
+# Inkscape prior to 1.0 uses different command options
+inkscape_ver_one = False
+
 
 def setup(app):
     # check toolchain first
@@ -169,11 +175,13 @@ def setupTools(app):
     This function is called once, when the builder is initiated.
     """
     global dot_cmd, dot_Tpdf, convert_cmd, rsvg_convert_cmd   # pylint: disable=W0603
+    global inkscape_cmd, inkscape_ver_one  # pylint: disable=W0603
     kernellog.verbose(app, "kfigure: check installed tools ...")
 
     dot_cmd = which('dot')
     convert_cmd = which('convert')
     rsvg_convert_cmd = which('rsvg-convert')
+    inkscape_cmd = which('inkscape')
 
     if dot_cmd:
         kernellog.verbose(app, "use dot(1) from: " + dot_cmd)
@@ -190,25 +198,37 @@ def setupTools(app):
     else:
         kernellog.warn(app, "dot(1) not found, for better output quality install "
                        "graphviz from https://www.graphviz.org")
-    if convert_cmd:
-        kernellog.verbose(app, "use convert(1) from: " + convert_cmd)
-    else:
-        kernellog.warn(app,
-            "convert(1) not found, for SVG to PDF conversion install "
-            "ImageMagick (https://www.imagemagick.org)")
-    if rsvg_convert_cmd:
-        kernellog.verbose(app, "use rsvg-convert(1) from: " + rsvg_convert_cmd)
-        kernellog.verbose(app, "use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
+    if inkscape_cmd:
+        kernellog.verbose(app, "use inkscape(1) from: " + inkscape_cmd)
+        inkscape_ver = subprocess.check_output([inkscape_cmd, '--version'])
+        ver_one_ptn = b'Inkscape 1'
+        inkscape_ver_one = re.search(ver_one_ptn, inkscape_ver)
+        convert_cmd = None
+        rsvg_convert_cmd = None
         dot_Tpdf = False
+
     else:
-        kernellog.verbose(app,
-            "rsvg-convert(1) not found.\n"
-            "  SVG -> PDF conversion by convert() can be poor quality.\n"
-            "  Install librsvg (https://gitlab.gnome.org/GNOME/librsvg)")
-        if dot_Tpdf:
-            kernellog.verbose(app, "use 'dot -Tpdf' for DOT -> PDF conversion")
+        if convert_cmd:
+            kernellog.verbose(app, "use convert(1) from: " + convert_cmd)
+        else:
+            kernellog.warn(app,
+                "Neither inkscape(1) nor convert(1) found.\n"
+                "For SVG to PDF conversion, "
+                "install either Inkscape (https://inkscape.org/) (preferred) or\n"
+                "ImageMagick (https://www.imagemagick.org)")
+
+        if rsvg_convert_cmd:
+            kernellog.verbose(app, "use rsvg-convert(1) from: " + rsvg_convert_cmd)
+            kernellog.verbose(app, "use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
+            dot_Tpdf = False
         else:
-            kernellog.verbose(app, "use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
+            kernellog.verbose(app,
+                "rsvg-convert(1) not found.\n"
+                "  SVG rendering of convert(1) is done by ImageMagick-native renderer.")
+            if dot_Tpdf:
+                kernellog.verbose(app, "use 'dot -Tpdf' for DOT -> PDF conversion")
+            else:
+                kernellog.verbose(app, "use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
 
 
 # integrate conversion tools
@@ -274,7 +294,7 @@ def convert_image(img_node, translator, src_fname=None):
     elif in_ext == '.svg':
 
         if translator.builder.format == 'latex':
-            if convert_cmd is None:
+            if not inkscape_cmd and convert_cmd is None:
                 kernellog.verbose(app,
                                   "no SVG to PDF conversion available / include SVG raw.")
                 img_node.replace_self(file2literal(src_fname))
@@ -342,16 +362,24 @@ def dot2format(app, dot_fname, out_fname):
     return bool(exit_code == 0)
 
 def svg2pdf(app, svg_fname, pdf_fname):
-    """Converts SVG to PDF with ``convert(1)`` command.
+    """Converts SVG to PDF with ``inkscape(1)`` or ``convert(1)`` command.
 
-    Uses ``convert(1)`` from ImageMagick (https://www.imagemagick.org) for
-    conversion.  Returns ``True`` on success and ``False`` if an error occurred.
+    Uses ``inkscape(1)`` from Inkscape (https://inkscape.org/) or ``convert(1)``
+    from ImageMagick (https://www.imagemagick.org) for conversion.
+    Returns ``True`` on success and ``False`` if an error occurred.
 
     * ``svg_fname`` pathname of the input SVG file with extension (``.svg``)
     * ``pdf_name``  pathname of the output PDF file with extension (``.pdf``)
 
     """
     cmd = [convert_cmd, svg_fname, pdf_fname]
+
+    if inkscape_cmd:
+        if inkscape_ver_one:
+            cmd = [inkscape_cmd, '-o', pdf_fname, svg_fname]
+        else:
+            cmd = [inkscape_cmd, '-z', '--export-pdf=%s' % pdf_fname, svg_fname]
+
     # use stdout and stderr from parent
     exit_code = subprocess.call(cmd)
     if exit_code != 0:
-- 
2.17.1


