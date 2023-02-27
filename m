Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BE96A35EC
	for <lists+linux-doc@lfdr.de>; Mon, 27 Feb 2023 01:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjB0A11 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 26 Feb 2023 19:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjB0A10 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Feb 2023 19:27:26 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9681285E
        for <linux-doc@vger.kernel.org>; Sun, 26 Feb 2023 16:27:25 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j3so3238634wms.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Feb 2023 16:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQnJvz9r//i40Q6M6D7Mlr1MIPxNoULnq+BRFHU1d6A=;
        b=a23NW50PF4pMGxYJT4CCynjxWmYi/cJUugpwl96WiTxeU6TpbJA9NKn2RjxsoxLzmY
         t6onK7Sd5ZbUCf4vsguGuWh+3A41HfXU4wWh+sXDVbcasv+0U+99LT7hOq+KSKB0NG+P
         S5oiiZuX6NNG3x8uaTWWJxUUEs7pO5rr141p9BA3NOc3HQK5DQrpMOV6pWCs7eKDDwsv
         /aursOpv8tK4rt9xQSfrE87giUJ/BWrLpQgTZaSiXINdpHNYRasWEezcr3gLneeabaH8
         EVUP9Clc0/E5BVElR7u9/9yGVWD3d/SvG8kB7HfWimwVHbFpveWFXwvT4ut+HIBbpb/J
         ttFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQnJvz9r//i40Q6M6D7Mlr1MIPxNoULnq+BRFHU1d6A=;
        b=XHUA2xYV/JZW5teKOioL8CKKY4a1Au83LkKxGA7o5/NZq9DA2x6cNu1/zPPqM4pRDw
         e+oNbK87Yvrox5UaOn20ZJ8lFwajthJHRwGJ5BiyVJ1EeuDvNBUpmbF3r8hhIxUQOC10
         AFNBDIY6sLstfX9llnowFsfkpqpyZuzRgm5D97IzvDG53DoP6nBjynxxfUmnOU7MEyo/
         junCE0yWvFTtpyKLDT9TJjPb29dFgCTPsrKTUgb97QT6VNfls8cjvYiApmYyDJCa30oE
         tmAkhkQxvaym17AeKQTZigmzZ8ihks6FetpRlGd2BMhjf0zri3hT7c5AH2JzMgx/zsew
         qc6A==
X-Gm-Message-State: AO0yUKWQ2uEw2ee6abQUCjrL7drdYPF8OlJahl6VhfjdSwb47LVOH6UK
        WW/QObJAY7v6WZ8i6jG6rImkJZLsNYydNN25q8M=
X-Google-Smtp-Source: AK7set9XdVTnviKXrck2xGYj7FdJ6tlPdPr6hb053vBbNBcdzfFKZ9H1A8BEDMpYJdPw7Go+/qzU70S4Y4zR5+VkfL8=
X-Received: by 2002:a05:600c:34d2:b0:3df:d8c9:ca84 with SMTP id
 d18-20020a05600c34d200b003dfd8c9ca84mr3195586wmq.1.1677457643492; Sun, 26 Feb
 2023 16:27:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:d1ce:0:0:0:0:0 with HTTP; Sun, 26 Feb 2023 16:27:22
 -0800 (PST)
From:   Raymond Dafter <raymonddafter4992@gmail.com>
Date:   Sun, 26 Feb 2023 16:27:22 -0800
Message-ID: <CAN3-JYm9YFvHmR04KiN5P9TKgaTd=Oap4mfRL6u_J0_vdy45JQ@mail.gmail.com>
Subject: We finance viable projects only
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_99,BAYES_999,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Attention: Sir

We are interested in discussing with you, Entrepreneurs, Corporations
and Investors (start-up Owners included) with projects that require
financing also in helping you grow your network and offering you Loan
funds to complete and fund your existing Projects.

We finance viable projects only. The board will need to review the
detailed Business plan and executive summary of the project then
negotiate on the terms and conditions if the project is deemed viable.

If we can partner with you or your clients, We can send you our
Company Terms and Condition after review of your project plan and
executive summary of your project, if you are serious and Interested
contact us for further Information:

Thanks and best regards

Raymond Dafter
