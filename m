Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8972B60CF6A
	for <lists+linux-doc@lfdr.de>; Tue, 25 Oct 2022 16:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiJYOnp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Oct 2022 10:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbiJYOnn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 10:43:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF5418F0F9
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 07:43:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id be13so22413485lfb.4
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=aPgNrYKriz2tlxwbo8vdeB9vHKXHF71ovMUPdSkwybM2sX3C9mbtEOU5Kkh+mObT1k
         w41d5JMo1IvEfKaxJxc3J4m1+XkKFG+ThFN7N0DK0OtuxFk5eRrb0FkzOVkmoMt96x8k
         8csXD/Znq5iaBU+8k0DQzfqlkLxcpabvaqYpEsBeFH1UC8q4LBuiTsWH/242X65159o9
         k+wBLfB8Ctw56YvdP5vJ2sO0C6x3j0LQlE87gpXRlA/seSlE+oU1Ufq6MPxT4YA5YMs3
         /VYpBcFxrUFlQRMBSAkZ68DawTUReI+ZW6pGlW+4kVWefY8elTIIBHsiC4Jkiz5JoWDU
         q6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=XDmeTlqxzPoJUz0FK5ZOUYyhE41Hc6vQhUC8WszC2mfq6EsmPrhLZ4TduZ4SjUtNCv
         /GbAyxCXpu7EGeK3i8Wcluavj/5fuQDlLi+AFFSpdzTvuBPXCNq0gKQbIbwD6hOekztf
         Qv7fk6iEDEcpq80BUsf2By2m3q/9xwD48dFC84tFRJN317mXwXjqVyz+BN48bhqJC31h
         bMxl253hMyKvgXzrG1mm1H9pOXu7A0EC5aU8xsAIxm7FIOaN08tSvE7BUTMj/yUxT40E
         3JlUxPfUvmvHpHWm0NNWEl1RHCJFTEi197lXc3Dl4MfMYq34E8m67pKRgANwkUFxkrrv
         HU4g==
X-Gm-Message-State: ACrzQf1t1CJ9hRtKcfauLYHTUMpMpzs5lD1of/XeDIsxMbKyAOqXfiQ0
        VFtQZCDNwzBoXNVINQmg3dC4Uxq40Dzv7+cjfmk=
X-Google-Smtp-Source: AMsMyM5/obq8L2OqQ6lsqf7cPFwohaKnp3v1FD12TgpQdXQRu4EjkyQ4xF91F58Q0ZMof/iyskOT7OawT5YmefLfDIM=
X-Received: by 2002:a05:6512:2342:b0:4a4:81e4:374b with SMTP id
 p2-20020a056512234200b004a481e4374bmr2583694lfu.502.1666709020762; Tue, 25
 Oct 2022 07:43:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1ba8:0:b0:1f6:1b25:a795 with HTTP; Tue, 25 Oct 2022
 07:43:40 -0700 (PDT)
Reply-To: tatianaarthur72@gmail.com
From:   "Mrs.Tatiana Arthur" <mjude4116@gmail.com>
Date:   Tue, 25 Oct 2022 16:43:40 +0200
Message-ID: <CADLcUi7KxqRFt6QOPWNOckA7rYNW17zcMwGYeOhx+fi3XG=EyQ@mail.gmail.com>
Subject: Did you receive the email I sent you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:134 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4936]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mjude4116[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [tatianaarthur72[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mjude4116[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


