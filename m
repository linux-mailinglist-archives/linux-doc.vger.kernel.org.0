Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06CA6474A5
	for <lists+linux-doc@lfdr.de>; Thu,  8 Dec 2022 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiLHQtz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Dec 2022 11:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiLHQtx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 11:49:53 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C766A865BC
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 08:49:52 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id x6so2162664lji.10
        for <linux-doc@vger.kernel.org>; Thu, 08 Dec 2022 08:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTJqkUg9tlm7AjuIGKJEdFJCYFhutqhsxr7B4Xa06U4=;
        b=cGVZguYhlMeDyHOnuYOMBTfEak5WyIc4CWF5vREBPAZx8fW4x5nvB2o4nKD4ZjF5cQ
         1D73Kq5vH7tVPyQIr50uI2Wmabu80RwhFntC/rb1hxYyNdbzVlPICmbneuAQutO6AlqL
         2s5azhzhWwVK0N+GCmpLHmbVQMBwqD8eFjhPG2kVHP3nhqTCRqZqGMwF50PeNip9PdMi
         oSqU7ew09cl1etoamXzNH3bAeeAfmbAsAnerPN/rV/Loy2QP6Z+NPUfleJkNTW7KHT3S
         J9OunNNp8jCwJ9FSi1wGRTy8koAJ7304YtXIdgc01h0XYpYqgqudgmSp2IYVKHwAtx1/
         JOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTJqkUg9tlm7AjuIGKJEdFJCYFhutqhsxr7B4Xa06U4=;
        b=ZnTHkfU9RyJwKrkL7Nx34J6cZELygOrXgLG7FgJxayKAGStGy9XEfr0W8bKqEJee0z
         J929P2xPsMCxy2dJPdlk1YUTuYuEGAAGpQmqS1nVeHzy9quw02mRwn4YNfCfVrh9q84K
         S3WJSQv8XIEILf0eVkg1jdhkMM2UKUt5Xav/1N/KjxJ97kZeMgcYIVQh4uECXnx0znbm
         0O2/DcduS2HCGPK4hhtyICMA5ximsbel8m0S9c7pu5UcBp21V4DYdFtBKwMRuJYgjvlM
         f1GFymy7iBj2QNhGsMMLwDPreAMXZJSX74SFhlw4BbiYJXL886sz/hdepeLlz3NCmRmh
         EIhA==
X-Gm-Message-State: ANoB5pm3+apprp6Kiwfi+U8zZLdTt6BtnXoLjLgopVRMQ6QUDyAShwJ3
        FsTfwk+ifZJFRQui5nmJyV06cLn7qhWFslsAzVU=
X-Google-Smtp-Source: AA0mqf6W0krD38H893y3t0LGpJoosWLY9iviKLINqVCQuMEsNviSZ95o/YhgyN5XvRUpux3pkpmrwA9n0RUd60B3LGc=
X-Received: by 2002:a2e:a9a7:0:b0:26e:2de:49ad with SMTP id
 x39-20020a2ea9a7000000b0026e02de49admr25257890ljq.511.1670518190911; Thu, 08
 Dec 2022 08:49:50 -0800 (PST)
MIME-Version: 1.0
Sender: mrsohallatif20@gmail.com
Received: by 2002:a2e:b614:0:0:0:0:0 with HTTP; Thu, 8 Dec 2022 08:49:50 -0800 (PST)
From:   H mimi m <mimih6474@gmail.com>
Date:   Thu, 8 Dec 2022 16:49:50 +0000
X-Google-Sender-Auth: 4Ln2dsU9RZqw9j9s5WntnB5F-8I
Message-ID: <CAP+WkJbyXC3Y839VoMFYgFS63YHs10CRzMF2ptzanSzRvUZoVw@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If you are interested to use the sum US$13.500,000.00 to help the
orphans around the world and invest it in your country, kindly get
back to me for more information On how you can contact the company and
tell them to deliver the consignment box to your care on behalf of me,
Warm
Regards,
Mrs Mimi Hassan Abdul Mohammad
