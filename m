Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF74E6B5D09
	for <lists+linux-doc@lfdr.de>; Sat, 11 Mar 2023 15:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjCKOwr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 11 Mar 2023 09:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjCKOwm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 11 Mar 2023 09:52:42 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272A41135CC
        for <linux-doc@vger.kernel.org>; Sat, 11 Mar 2023 06:52:40 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id by8so8305004ljb.7
        for <linux-doc@vger.kernel.org>; Sat, 11 Mar 2023 06:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546358;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj8nrG0sL8loOIOhZdmt6f4M2skgayD9pumOqV207G8=;
        b=YKMEhdApj5X8jDUQMd8Bc5EFxz5MT1uvr6nOFMxwtRApuJKrPyGcZUY8RR2bm8sId/
         /MYu82rI541esxSQbby7NHUPk+0uBeYlhaj03ZFS2dnV4ou/G6KwBVaGY573hRyr52I7
         bnHT7Jz3G1lz4EJeKfZeNLHe3Ofhm19dT7VNrFjVNFPTVrIOfje3iqcrZSUgjACfc+9s
         1UhU0qStTw2hsSILN9bxAX2m/oBx1LMJ9HUdGEAxjwQuc8JESCHb/yKiX1C92FYUW1aj
         qhi+BfDZgJfi4SZiVb/GPJlctnh4ID3UjfT6xuHs2w/JAfwr7zZvJi4ljtSthqRptYQa
         yKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546358;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj8nrG0sL8loOIOhZdmt6f4M2skgayD9pumOqV207G8=;
        b=yTcmOYayhHr6/1m775wgHE5zPs8Votmj4FbYkSH7iuRXxUcm1Mu34bzjB9TFdTCnB0
         kYOamPYZXXa8PMmO74r5UFrh/Z5uMLWRbjWPNKxScKnUYydTSfYsw1f0LTZnwPjF2u69
         yOCfWRoMLSV5qFPI0/Ttu2PnTsXkzwmCh4ZPRUopLr5EvtybAlNGjaasL9IsIvz/Vt9j
         blvOIU0mpQqoT08XPx9+JMU7oPpMu1OCZBMDw7rtuNuTywXGvswGXJsiwMdLA/HTlpY2
         Bb3hIyaevGOomtcBD/5CzXFM5BprYqg7UXxwZF0f6vw5UCS8uKGe56TrlBHjTkwbjGiz
         UgYQ==
X-Gm-Message-State: AO0yUKUTmXgMKr5RdcmqhoS7Kou3WM8AJzQeMjJki2vP8viSkN+3k2fm
        jMWgVxoAHscHEJKbPmXBEUR3DAxqQb8vlZqw9yA=
X-Google-Smtp-Source: AK7set/Q3gx76aJrzE4SuUWtwufrEgQz1FLhedNSEuueuFeKI7nQfTBabPVF0Oq9ugXC1lG0ttpPd+/uKq3x9Bh6ta4=
X-Received: by 2002:a05:651c:10a5:b0:295:9626:a20f with SMTP id
 k5-20020a05651c10a500b002959626a20fmr1859407ljn.1.1678546358215; Sat, 11 Mar
 2023 06:52:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:389:0:b0:21f:c391:1da7 with HTTP; Sat, 11 Mar 2023
 06:52:37 -0800 (PST)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <concepttradinglimited@gmail.com>
Date:   Sat, 11 Mar 2023 15:52:37 +0100
Message-ID: <CADfPB6daPDCFQ49imOgJd+KwMrrsvzpD5Vmc+0Vvq3W9Xr6TGg@mail.gmail.com>
Subject: VERY IMPORTANT PLEASE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22b listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8917]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [concepttradinglimited[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Please are you capable for investment in your country. i
need serious investment project with good background, kindly connect
me to discuss details immediately. i will appreciate you to contact me
on this email address Thanks and awaiting your quick response yours
Amos
