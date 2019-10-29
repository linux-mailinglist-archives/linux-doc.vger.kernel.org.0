Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0FFE84AA
	for <lists+linux-doc@lfdr.de>; Tue, 29 Oct 2019 10:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbfJ2JpS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Oct 2019 05:45:18 -0400
Received: from smtp1.goneo.de ([85.220.129.30]:44352 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727504AbfJ2JpS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Oct 2019 05:45:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 205C1240E15;
        Tue, 29 Oct 2019 10:45:16 +0100 (CET)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.781
X-Spam-Level: 
X-Spam-Status: No, score=-2.781 tagged_above=-999 tests=[ALL_TRUSTED=-1,
        AWL=0.119, BAYES_00=-1.9] autolearn=ham
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id J1DaS_VLtVXW; Tue, 29 Oct 2019 10:45:14 +0100 (CET)
Received: from [192.168.1.103] (dyndsl-037-138-239-146.ewe-ip-backbone.de [37.138.239.146])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 8E05423F402;
        Tue, 29 Oct 2019 10:45:14 +0100 (CET)
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net
From:   Markus Heiser <markus.heiser@darmarit.de>
Subject: ImageMagick (convert) error
Message-ID: <5f9260ab-7050-a0fe-cc15-2baadd72fcb1@darmarit.de>
Date:   Tue, 29 Oct 2019 10:45:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Is it only me, getting zero-byte PDFs from SVG and this
ImageMagick error?

   $ make pdfdocs
   ...
   WARNING: Error #1 when calling: /usr/bin/convert \
    Documentation/doc-guide/svg_image.svg \
    Documentation/output/latex/svg_image.pdf

this is due to a ghostscript vulnerability [1] and was fixed
since gs 9.24.  If your gs is newer:

   $ gs --version
   9.26

You can add the needed policy to ImageMagick to your policy.xml
but first lookout for existing entries in the policy.xml.:

   $ locate policy.xml
   /etc/ImageMagick-6/policy.xml

There you need to add at least the rights to write PDFs:

   <policy domain="coder" rights="write" pattern="PDF" />

Hope that helps ...

@Jonathan: do we need a entry in the docs [3]?

   -- Markus --

[1] https://www.kb.cert.org/vuls/id/332928/
[2] https://www.imagemagick.org/script/security-policy.php
[3] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#image-output
