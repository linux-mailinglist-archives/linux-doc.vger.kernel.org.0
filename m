Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1361C5F84E9
	for <lists+linux-doc@lfdr.de>; Sat,  8 Oct 2022 13:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJHLMX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 8 Oct 2022 07:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiJHLMW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Oct 2022 07:12:22 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC26450F88
        for <linux-doc@vger.kernel.org>; Sat,  8 Oct 2022 04:12:21 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j4so10651342lfk.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Oct 2022 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8Lc3wAimhB0NV3fEZnKSiGf+iaWHiRr2Q0Yml4bXTw=;
        b=LBhj25r7/mLXKD4GIiMyD28/FKeL8yS2brXuqPSO5erm0QH5xSox5hD5xxEWLBpMT3
         gd0etfMzPZMbpF2m/SAQ65nBG0p2jNQqgcuhyeTz+RIzPc7qrERYCTzb5wktKuu2mMBv
         4LHeyTYUjHbBuFkuDX6X2488OxPzo9cPqXoyyqGSF+ILDWo29v9zyqJy3AZzKxRGzHMC
         2kcrDCw2EOO207oAvEXL4iBZrVC7LjrfC+HYSYJRLVTm/pEaNc1V2G4AmZD8U9BrbAUr
         Qj5g/8/05mFizeiDRuH6W4aJQCOq37A4PVZOgUeK97AAvChGi4DdDBeCmZjekJfNYiBx
         zzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8Lc3wAimhB0NV3fEZnKSiGf+iaWHiRr2Q0Yml4bXTw=;
        b=BgSkdq6qnvmHjgiVnpIs6nUXDC4NDdZlRtOowvOoeh5BLkZ/NJhuaYmidqWGkGeg9d
         jEj/7MsLMmPEtOlKWmouqLETmH13y+YMYN0FEXoLFi/HDKX1TSR9D+rKS/EDWnpUODwN
         dwo1ec4RzL9DiZUgWqm45wMn+K5OaBXtHhWpeFh/RJX+bSzwuFt3hYTMKAaMqGfhrLkL
         k/L780Ej0LQjomfTmrCNBz52StkEWOLQHmQCeSqTXWmKAfysz5MyIh7PaI1i0exTotm2
         PkUWb5E/XHpOchwG5LsU/En0Q1q7BCMn7SjxOlxD8lLN8bxPd7+YINKtWEUM/cuGk5q8
         szRg==
X-Gm-Message-State: ACrzQf3oCscSDp9J7yT2dAWdDx0DWGVKJV/P4fGxAWNYYzo5nR/Z1JFX
        Zst9m3+im6N2pdtqJBe9LKXzcu+cODbQKzdqphQ=
X-Google-Smtp-Source: AMsMyM6f11XH2Qi1i1Kln79Wg8cCcmr9HOTCH6VJRLpyQJawz+/jxmw0mAGNZzmF2l5m4KSVwPKjRz43BhFUkP6cTDo=
X-Received: by 2002:a05:6512:3b14:b0:4a2:7ee3:b0cb with SMTP id
 f20-20020a0565123b1400b004a27ee3b0cbmr3102043lfv.626.1665227540168; Sat, 08
 Oct 2022 04:12:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:651c:1a20:0:0:0:0 with HTTP; Sat, 8 Oct 2022 04:12:19
 -0700 (PDT)
Reply-To: financialdepartment0112@gmail.com
From:   "Financial Department U.S" <fernsbyedevane@gmail.com>
Date:   Sat, 8 Oct 2022 12:12:19 +0100
Message-ID: <CA+PniE5LJNMjYPhQgXRvZH2WokOqF0WSHGPXRs6OQG0rLdkLNQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:142 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [financialdepartment0112[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fernsbyedevane[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Dear Friend,

I have an important message just get back for more details.

Sincerely,
Mr Jones Moore
Deputy department of the treasury
United State.
