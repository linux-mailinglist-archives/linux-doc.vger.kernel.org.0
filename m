Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39005279AD
	for <lists+linux-doc@lfdr.de>; Sun, 15 May 2022 21:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237189AbiEOT7q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 15 May 2022 15:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236683AbiEOT7p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 May 2022 15:59:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781ED389C
        for <linux-doc@vger.kernel.org>; Sun, 15 May 2022 12:59:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq30so22663394lfb.3
        for <linux-doc@vger.kernel.org>; Sun, 15 May 2022 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=V4IkW0742iDDCblH6TKQehjLzwt2/mXIWc67I+JadRb573v995Cs0eXBZF2QtmfbqC
         GJh8O9Z2pcNlBaEjuKNyweCUk3TsV5xxO+t39JP4fY8+42SenZH4KM4aOv25h9iIDOfr
         I4A77NMpZk0lITscJc1zu2UpPgJcrdPIoNDM+MuwLb3G7zkEeQoPKQOyzfn8Mzc4HUSl
         H6My8jXIe692cAg3pGkGc1CbNYAWna9Apa9PsjcWmSAu+mbRPNQd0Z9qGGqHVsr6SMqd
         hy5VpubJKmzksHHbaJqTpqA2mZxL834i2xZycq11DajBu8QD8dzInf/Trul+J9LPo4cd
         ltOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=HkdMIn3CZr0Y06wSBo5vuFpU3VmN+7ShqgKCddU/mqW9augqmH8IWFgW3SUqtQTOIH
         oGbBgMhvzUtgmO/MfICPOQnftUjl/QR4en0TR7eX4MmHbBZGReSX5NHUZuNV4CniXrkE
         8oIylEBhOJht+3K3prtDX11Vb6AhX7oCWtQWSB1AHto2BAegBHSl4SRrYIx24e469vHL
         GB8O7kV7xEFwlpbwo7Qc2uAnYu+m3fbly4OVt35KRcEE78hC/YN9oxqmTxyd4366P3VP
         5dtmnD5wa1aMWtLsOoOCgQJqyIVDsBSBRstdtrC8VJuwoLzPBE3zU1DoKY+IWEKbqoFQ
         TOFQ==
X-Gm-Message-State: AOAM532X4qyj4HVpg7YkLrL/qESSY0TBca54DH3gkKVhnMzlqqkiNBVw
        0B1l7b1i0VHqzqHfNeyhHOVioM2gcxwylFuBSCA=
X-Google-Smtp-Source: ABdhPJw3JaKLceTz2X3nXibHZwP0RpP9oiofC4uv6HCaLBwZUSPM6RS8bIymRQ8D7yZ34A4RVOU9IicFASGIH/QY51Y=
X-Received: by 2002:a19:7114:0:b0:473:e3f5:c7ba with SMTP id
 m20-20020a197114000000b00473e3f5c7bamr10831793lfc.9.1652644782614; Sun, 15
 May 2022 12:59:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:44da:0:0:0:0:0 with HTTP; Sun, 15 May 2022 12:59:41
 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <raqsacrx@gmail.com>
Date:   Sun, 15 May 2022 12:59:41 -0700
Message-ID: <CAP7=Wk4kmnOaO6fLs8afE8OOZ9XqRO7PhrieSfazjL3T3LC6KA@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [raqsacrx[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
