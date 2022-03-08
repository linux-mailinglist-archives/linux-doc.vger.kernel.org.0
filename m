Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E524D1B7E
	for <lists+linux-doc@lfdr.de>; Tue,  8 Mar 2022 16:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343964AbiCHPSI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Mar 2022 10:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbiCHPSH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 10:18:07 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4364049C8D
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 07:17:11 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id w12so8452927lfr.9
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 07:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=bzKa/gepu6KpGkatVYCULP/8qyyqnV5JEjEKNbZxbww=;
        b=px8eJG5RuTIeHZn9FwneaY64XLwo6qk642Cv+R/dzVUBniy+AUwr7sP4zAYFrTBwMC
         TP4ZCSnwuCsz7LPZrx8zaXxvPEt3t3Kg9wEnsR+QSaucDB0fpgUNmJUmjuX1lVybBUkS
         4NkAa916ekma8lsXKxVcIRGlg2+vu6XyUnoiEEocADtyNJG1lymeaPewSQLMorn1lu/x
         Sye8k77Gbsui+9/SXHMfXcZzD201m/fsRd25kZD78qMq/Z+Vyw1tJoLM0j2j2SgOycCP
         JD5dJqbmRSxyul/MhbmuPNZIoZSIxKo/687q+q2uDEr3FdwVB5qEN5L47nXFWsoE0w7O
         ys7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=bzKa/gepu6KpGkatVYCULP/8qyyqnV5JEjEKNbZxbww=;
        b=MYHvd6uq1HFbNbRWaVrmox0DUXDPnZRU1XR0vo7+m9RhuYyqTyOkEjN+rqJzlH60Q+
         8v63+P7VGcNgUwICUuBgFYB9/+rBQoXcfDrpDQcYPrHGznXklv7pGY6kzPWezygxB5XP
         Zfm272eaZ8IXTd+GyTFeM+euER34MScBPNMwTcHlRC+8Dqo/21T5c7y00sEog3P+MA8K
         1EMcq2flyb9yjNaMs0FSuc1y4rEb4tzEHP6u54p71TiLGdQPU96mtbY+c4CNyPnvrF45
         Ah/ydhOk/NTRD2kvw3mLoSYPruPaNHqaAdGZ6dmitbgIg7A/C4sAKvjsM5okoWrb1Fox
         LumQ==
X-Gm-Message-State: AOAM533U7bk6YkWqJaQINrO3oCzSMQbDBe9l+koHTUaFEP77fC4SMSJT
        /HQr5UM25hLpeSplSce3TIALEnLZlRlLM04fHY8=
X-Google-Smtp-Source: ABdhPJzp0pvZedCeag5pTMucjjApyNxe1ChnZWLIuW8PWUSgvYsW25jl6XfJ3KjCzGtf01AfX/RyRev0NgkEW6UE9To=
X-Received: by 2002:a05:6512:1689:b0:448:4289:abc1 with SMTP id
 bu9-20020a056512168900b004484289abc1mr2062243lfb.521.1646752629630; Tue, 08
 Mar 2022 07:17:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:5d96:0:0:0:0:0 with HTTP; Tue, 8 Mar 2022 07:17:09 -0800 (PST)
Reply-To: Amazon.inctops@gmail.com
From:   Tyler Hubbard <hubbardtyler661@gmail.com>
Date:   Tue, 8 Mar 2022 07:17:09 -0800
Message-ID: <CAC2jbQkyfE+es10P+bvSQUXM3g2mm+D9pgGDHHFog71B9e7JMQ@mail.gmail.com>
Subject: Job Offer
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:144 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5397]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hubbardtyler661[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hubbardtyler661[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 

-- 
Dear Applicant,

Our Head Dept has reviewed your resume published on Indeed for an
Administrative Assistant/ Customer Service Representative ). Your
resume has been reviewed and you have been shortlisted for the next
step.

We are pleased to invite you to an Online Interview for the position..
You are required to contact the Hiring Manager she will brief you more
concerning the position and company.

This is an immediate hire. Therefore, The interview will be conducted
Online via Google Hangouts. You are needed to install/download
Hangouts APP on your PC or cell Phone. Once done, you are to invite
her on Hangouts. Her mail is Amazon.inctops@gmail.com  You can as well
send her a whatsapp message on +19132146429. In regards to the Online
interview, the pay rate is $50 per hour

Your Verification/Hiring code is "HRP7KR5S", this would serve as your
identification code throughout the online hiring process.

Your swift response matters a lot in this position.

We look forward in working with you as a team. I wish you Good Luck on
the interview...
