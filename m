Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F755F4399
	for <lists+linux-doc@lfdr.de>; Tue,  4 Oct 2022 14:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiJDMxL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Oct 2022 08:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiJDMwZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 08:52:25 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A59F5B04C
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 05:49:16 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id n12so1571871wrp.10
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Cu6b7ZN0dgGtN7fdvkPwkQNJMEd8xnB+TytZDVH85O4=;
        b=SZxHh0vRep2SusQSY/noW6QfN3VqbWjAssGBeDSl+zQD54DgqK5mGVSRByiFq8k3Zv
         WYBRTbvgn6ATCtI8QM/jI3158/1Mxfr5OPgVX8YBFPv50AdncrAfhIrubfEH8OomuOvt
         73dvrOs+HQIu6k3rmiTxtIGq0wc5uS2kLzVauGLa52drIZB+/iB5ejTB2mxIHkVj3S10
         8mgZ75PlNHPuz+vQZ5Qhs+5U1c9w0nb56dFsKAxOWRXi55+OLq13IqNPrI+nIR6FGCxH
         ihvW6peC7nXS1XJMJUH9V4T/dK/wWFmbnmBqBYo/OJMytjMIXJ/AQlTrvyspBPMlHlux
         WsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Cu6b7ZN0dgGtN7fdvkPwkQNJMEd8xnB+TytZDVH85O4=;
        b=rfysuYxe9PzAKfPvHgOG0MOeGjJd5BLUXor3mQJr3MZOFrmL34ivkF9bBGuL+5NCsV
         2oFLoa3WRGXzZfrp6CgAokWnEbw0pz67hjfZ6JWRxey9NgNPAnviklhGsRGsk106m7cN
         DxdStyqYt8eghTSjrBkNvccgdrAOnrjsVwqTLfRGp0nId62E+JTRTkL8gr0ztOxxH7zM
         rneCI5cDHIDu57hK/KtYOL4t4mvCTOyP01iX39D+uvEbPDPEYNHLFsI6W4h1E7KF+mZt
         90u12ZZjgSAeGCMoqXFRAS3nlg7CwE/cLaw6pnijNW28IoTJUVH/0IAJKBn1KrA3KRgI
         FLZw==
X-Gm-Message-State: ACrzQf2MOFvF4VFJWr46ys863zWBi7y0qPixhyHJiida2My19y90QN8v
        AG2IC1R5vron94hZaeFgOdLiaA==
X-Google-Smtp-Source: AMsMyM5/km+kEOBFgkbQoGDsH88/3NlEJHUPiOwVb2ss58TTovChJ4NjHzJfWLHVgToeiTBnyqarXQ==
X-Received: by 2002:adf:f48f:0:b0:22e:4244:970e with SMTP id l15-20020adff48f000000b0022e4244970emr4724488wro.140.1664887754719;
        Tue, 04 Oct 2022 05:49:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m12-20020a5d56cc000000b0022e58c14588sm353659wrw.85.2022.10.04.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 05:49:14 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com, akiyks@gmail.com
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/1] Fixup instructions around mailing recipients
Date:   Tue,  4 Oct 2022 13:48:57 +0100
Message-Id: <20221004124858.640349-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V5:
- Drops get_maintainer.pl removal of supporter - Joe Perches
- Back to one standalone Documentation change - Krzysztof's suggested list

RESEND:
+ Akira

V4:
- Change the subject line of the series
  Previous: Expand get_maintainer to be explicit about supporters
  https://lore.kernel.org/all/20220930064629.329514-1-bryan.odonoghue@linaro.org/t/

- Update get_maintainer.pl to return "maintainer" for both "S: Supported"
  and "S: Maintained" - Theodore Tso
  For the purposes of sending a patch whether or not the maintainer is
  listed as volunteer or paid is not really useful information.
  Listing both as "maintainer" is clearer the end user.

- Incorporate Krzysztof's list of recipients into
  Documentation/process/submitting-patches.rst.

- I didn't include the get_mainainter.pl example.
  Comments from both Akira and Joe suggest to me the example is not that
  useful.

- get_maintainer will no longer produce "supporter" so one could argue that
  the documentation shouldn't refer to supporters however not all of the
  potential output strings are documented and I've opted not to document
  "chief penguin" either.

  I'd like to focus on the particular case of supporters with some
  reasonable knock-on documentation tweaks for the obvious gaps we've
  identified in our discussion because "supporter" really means
  "maintainer" and you absolutely have to mail that person to get your
  patch into the right inbox.

V3:

- Drops change to get_maintainer.pl - Theodore
- Rewords around `get_maintainer --nogit-fallback` and gives an example

I think the document text now is clearer and should be more helpful to
others in getting their minimum submission list right every time.

V2:

https://lore.kernel.org/lkml/20220928003006.230103-1-bryan.odonoghue@linaro.org/T/#u

- Documentation/process
  Added in text to also make clear subsystem mailing list should be
  included - Krzysztof

- Changed get_maintainer.pl to print maintainer[supporter] or
  maintainer[volunteer] depending on MAINTAINERS file. - Thorsten/Bryan

- Choose supporter and volunteer instead of supported and volunteer
  Supporter and volunteer describe the role of the person whereas supported
  and volunteer would describe an activity and a role which isn't
  consistent. - Thorsten/Bryan

- I didn't change Documentation/process/5.Posting.rst
  This file doesn't mention get_maintainer.pl and I was mostly aiming to
  fixup the process around get_maintainer.pl. - Thorsten

- Myself and Thorsten discussed changing get_maintainer.pl, how it seems
  like a desirable thing to do but also that "it might break scripts for
  people" and it might.

  I don't know if get_maintainer.pl is or should be considered to be a
  stable interface and an explicit software contract but, making it clear a
  supporter is also a maintainer seems like the right thing to do from a
  transmission of information perspective.

  There is still the option of just updating Documentation/process in
  isolation.

V1:
- Sent a standalone change to Documentation/process stating
  get_maintainer.pl email addresses marked "supporter" should be included
  in a patch run.

Bryan O'Donoghue (1):
  Documentation/process: Be more explicit about who to mail on patch
    submission

 Documentation/process/submitting-patches.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.37.3

