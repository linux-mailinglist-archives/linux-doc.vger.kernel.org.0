Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5DD58AA05
	for <lists+linux-doc@lfdr.de>; Fri,  5 Aug 2022 13:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbiHELTX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Aug 2022 07:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiHELTW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Aug 2022 07:19:22 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECE865814
        for <linux-doc@vger.kernel.org>; Fri,  5 Aug 2022 04:19:21 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31e7ca45091so21329767b3.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Aug 2022 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=muUdW2iF3NLjwFcKkUArmJmVBNuXYz5InLqAh5elhfQ=;
        b=PBodHE7kki145FTZixnG2EtB/k6IXOGcZbPII4aVnWg8c5SAeYspb+V9eep8AdQsz5
         xArW2f6Ewzajstb9X4c3FegWotxUL4bMQQn9RyYEFQy4VUPYEjxwotX4oGNNbOYY913U
         A/jkGK/CuQIynkn9L2nRv1ZI1xFTZd2ns5nhAHoDixS5EudUU6GFv7IqpT6B2Krpx7tr
         9Dr3QzvCc4H6ECDXT/iuII+hbM6xjST/EHCKRQ5hgK2dRc0/Fcpf83itLcP+PUVyvH8B
         b+AoDRmnh8m2p4jHj/4KLNAxV6WwfzZHoF4mY26w5tGFaUiqvHNcltd1uA3FYS4Wo5Ky
         1qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=muUdW2iF3NLjwFcKkUArmJmVBNuXYz5InLqAh5elhfQ=;
        b=BwA7eJkMFZlX0najO9kMBhsujFbax4m85C/OQUp3X4/vojSGfVvg5euFaAyZooe+li
         3VCU7zcfo0hgeznJM56euQBBxXQdLmZfPaYmsfBy5la9/66OHmtF9troHXm3uVMCpOZ4
         PbRaasaJ9H32qHlqVIO8tE5CnUKSWHlTPijHYVecITOtFmcXqCh2g9kIcQuzoqP3bkFI
         +huH7MO3FWGcy7ZyiFZ/15X/heso9EGpBIFseSbWklp1twzBMq+qICdiw0Dm9Mzqoytt
         OT6rG/SXiGaT+y+tL4UXtiTUDLhQ8NBx0iFNZ072yiiSECj0eM3hxu5XRsygzh62QJmx
         B8GA==
X-Gm-Message-State: ACgBeo3DjkX7K/f+YsMujpHs9ekzf7IjWUfS6wVAzAFQn/p5/zRR5pOO
        2Fsud8cDkgqWBY1jdk7WBSV7bAViJdWbWQZne+8=
X-Google-Smtp-Source: AA6agR41M5mLY/QdCwfAI/uDCahVTdVzTM8cETxCV7hflzDidVXmxgV3iS/jg1HozIVcY+Sd/OvLZY6jq/+lrmFiQss=
X-Received: by 2002:a81:3946:0:b0:324:9866:832e with SMTP id
 g67-20020a813946000000b003249866832emr5721746ywa.35.1659698360671; Fri, 05
 Aug 2022 04:19:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:5087:b0:2e8:760f:3500 with HTTP; Fri, 5 Aug 2022
 04:19:20 -0700 (PDT)
Reply-To: rolandnyemih200@gmail.com
From:   Rowland Nyemih <fralaimetals100@gmail.com>
Date:   Fri, 5 Aug 2022 12:19:20 +0100
Message-ID: <CA+5KX23AR5NAsfDwrrjrAv3p1Vc-feP5QU-VDD5JBVGLzX=WcA@mail.gmail.com>
Subject: Rowland
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1136 listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fralaimetals100[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fralaimetals100[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rolandnyemih200[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HI,
Good day.
Kindly confirm to me if this is your correct email Address and get
back to me for our interest.
Sincerely,
Rowland Nyemih
