Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27EB688597
	for <lists+linux-doc@lfdr.de>; Thu,  2 Feb 2023 18:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjBBRiH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Feb 2023 12:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjBBRiG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 12:38:06 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86BC2278B
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 09:38:04 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ml19so8287702ejb.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 09:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saZXT4FVI4lVk3lAqqpv+j8azrC1do2+12xZnwClNAM=;
        b=GVi/xTjyB3KESWFYcVFDR1fCHGCx4+7VGvSUpv3OT9IkAB9UH7mvxN6VYoKtGqd4Cv
         m26hvaATfW/2ZtlhhY7AAC3u1g0XZng8t70LNJC4R3zVGgNDxwaQSsoznqFPD/U+Xu8C
         zi1NOmcagkVXROKb9fPFOZ4MwGAllb0UkBEB6nfeqjtXLd/Z2V++KxWSFNtUh0x7ejtP
         6evq+mlmFhPHJt/R9tcr588Ycx7zpOrPXJmT+P6dR51sDF+keE+rvvOv92dta7Jl1iki
         Y0KSDuV+lS4WWMyug3E70IKQjisdluqzaI1wBnjOEY8bsAvIJ6lhFDxsv2WajHVOnU7L
         ew9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saZXT4FVI4lVk3lAqqpv+j8azrC1do2+12xZnwClNAM=;
        b=gFeaJWa88U1EszLh/AnZ4n16dnWwiJO1Oku7Mex9Rg9LHlfRE+g5KOxvOfbMzqolAH
         m1umcF1PDmQOg51GvWScFqLfU7tcinTIr+vmMtGixk/zgq2J0Sn5IgaYPz8vNUR5GxIT
         SGtHJ7ftogP4ACLFcs4nCPeLqVl08747+Knb+DOIDSlySC5GRXLGV8vdM9ofQ5BqAdf0
         IzngngVvJSdzao7E2Gc5Ce7P1NouJ7b9/L6BacqgGlA6NP2AGTUdobOe1Zdr/GFk4Maf
         +82ysMgY5HvC7Zuy/Bk8RbnPB1RBeu7L28UV9L3zA6muU05BRFIHcbPXMzvuqSiQNvM8
         gEtw==
X-Gm-Message-State: AO0yUKVWNsMYxDZPYRedhjNry+Qs9PEh6rVmkd+XwOsrg7puf6pMbYWA
        LEsEBRi4DkTwwNd7XR1Js/sDPZ5Du/dsqcp50C0=
X-Google-Smtp-Source: AK7set/Y2SR3n2MRHAu3EUPkTvHch5WOHuqf1YEfsOXaCZSdSQiTrqkIk22eV8b5+XXsA2UpZK2dswkBpVWIrXF5OY8=
X-Received: by 2002:a17:907:990b:b0:887:9adb:da53 with SMTP id
 ka11-20020a170907990b00b008879adbda53mr1697307ejc.166.1675359482921; Thu, 02
 Feb 2023 09:38:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:f748:b0:885:fee4:69db with HTTP; Thu, 2 Feb 2023
 09:38:02 -0800 (PST)
Reply-To: mrslorencegonzalez@gmail.com
From:   "Mrs.lorence Gonzalez" <moutakilouimorou6@gmail.com>
Date:   Thu, 2 Feb 2023 09:38:02 -0800
Message-ID: <CAKP+CCtpOFxH8Xwi_B58JL0xKNgHDoc0QhobQP7EtHHuE2+maw@mail.gmail.com>
Subject: HELLO MY DEAREST ONE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [moutakilouimorou6[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [moutakilouimorou6[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello My Dearest One,

Am a dying woman here in the hospital, i was diagnose as a Cancer
patient over  2 Years ago. I am A business woman how dealing with Gold
Exportation. I Am from Us California I have a charitable and
unfulfilled project that am about to handover to you, if you are
interested please reply.

Hope to hear from you.

Regard

mrslorencegonzalez@gmail.com

Mrs.lorence Gonzalez
