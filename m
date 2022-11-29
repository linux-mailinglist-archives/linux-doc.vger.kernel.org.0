Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAC863C928
	for <lists+linux-doc@lfdr.de>; Tue, 29 Nov 2022 21:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiK2UR5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Nov 2022 15:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236828AbiK2URi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Nov 2022 15:17:38 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706EB59857
        for <linux-doc@vger.kernel.org>; Tue, 29 Nov 2022 12:17:14 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id b9so18569103ljr.5
        for <linux-doc@vger.kernel.org>; Tue, 29 Nov 2022 12:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=V8rSLb9Cs+i68CS6FbNcHSzuXpNa7yfMGlgpB/hYq17dea7RA7JaIcu5YagzJ3Md4d
         +CgVOFn5+lvnglvRT3zxVo0NuhAUY5ynUvmMAQio8IEwlte3rQ7SCjUw7xj3g/X9vHQG
         sSiZ+hg09gyOQnZrqLiKcSBrteG/r+fx/2Hx6ctl78XXZhNMRYLlMcq0F6iWf9G20VVT
         hg9BijPXqej0Mltas3xYw2m2Z3GJPTW/rTBcsNdlctk+6UVKnS8pYu1E2NM5QrJzaDqu
         XrfFFOnwPSioPweSHCvTDmEgI6kBRoS4wCGs0qoZ8oh9CkqCFHbnjTbBBoEoVMVdrh1K
         JlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=0tNKDOX99PhY0rKNTM8kXkd+vXvUgnzGbJPvC6PibeU/ZhNF98oz1RjMagBQiUIGA7
         mk3RXNqGfV3ofX09Ee5/yVBndZPq17OURrSfY8AgYRCmTnVBxkP2Rxx8ayU5ie7RkYL6
         Sn8nZ8A4+uTQGsHFLmMPo5CDO5ZAE/iRkzIfyZM1zbdQqE/91/TYSKx1T0/f5z1gB8h6
         VPjE+4rwKTeSjsGU9c3RFFV4cILqJhfgPPOUXAWWCWt4puI+FgrVu2f4A5w7JFItHGiu
         yHCiv5wIdj2hMBcwN1UeulJl0BhPGcRHs+Wuhhd49fkglErMFv23ZyT+7FYRTzG8nz9E
         siCg==
X-Gm-Message-State: ANoB5pnnYtX091w/vv+fwCYlCaif8BboGSj6C+jzpTmDS6p7JsCZITmt
        WYIlkT259hp/jp1RDdHDDp+h3CBy45S3OZQcMQU=
X-Google-Smtp-Source: AA0mqf6evAEGpcOA9vXKkbNNPl0sac92/LC/9JJzWJDoQuLJYtxxZ53MbWtwL2p+WTsHqoPsUyU6tRZbHt2evArZ/gs=
X-Received: by 2002:a2e:2c01:0:b0:279:926e:c9b9 with SMTP id
 s1-20020a2e2c01000000b00279926ec9b9mr7205661ljs.170.1669753032468; Tue, 29
 Nov 2022 12:17:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:651c:a0a:0:0:0:0 with HTTP; Tue, 29 Nov 2022 12:17:11
 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <chiogb00@gmail.com>
Date:   Tue, 29 Nov 2022 20:17:11 +0000
Message-ID: <CAAtWbkGWPPXRSpGX5T1vKAteDPKwR6CfGc1Z4UATifQAqhUz6g@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
