Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398E8530CBF
	for <lists+linux-doc@lfdr.de>; Mon, 23 May 2022 12:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbiEWKMw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 May 2022 06:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbiEWKMu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 May 2022 06:12:50 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F33AE48
        for <linux-doc@vger.kernel.org>; Mon, 23 May 2022 03:12:47 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g12so18460889edq.4
        for <linux-doc@vger.kernel.org>; Mon, 23 May 2022 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uc-cl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=z+uM7vIRKv3KK6/ogXLySxrVBPRCNjdMKIe5V0kgmw8=;
        b=JXDGBBA7JGqlxXHyvQpaU9r1OfIG4UChBlTRgcZiFqNDPkMn2lUkVmzq7G3QvVoimG
         QjUarawautbENaTcxz4YxjPg4mysypVybiMPe+hDyI1E7HLqTZHKPb9TrAF9eEZuABWl
         aGyr/1wpO+qcIz9w/F0yrngVWxFR+/rnWAS61Ad3plMjgV+rkUTmEQ7e0hZbppPwg4L/
         eMuV0I0nKMlhXrhOInmf4d/DA7m9hnpx+/gTaqLEhsmerxCwSud3Ym8rvVmV+/HMtcdv
         AeK+kvohkv4VET64mJP720/GCURh9eqCf97bUUYPeFIkWTJI/56C4pUu739J7seVc2kG
         d1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=z+uM7vIRKv3KK6/ogXLySxrVBPRCNjdMKIe5V0kgmw8=;
        b=WyoYB/b0d+H6KcI7XgSgNzTraybQclI6ulXOqiYhyuipQEaXwGPcmCEM5PxRLiMue+
         fMKAGK5NcrJeWmJo2Zn3tByd/MfjzW9ZR5tH3/OaIEgM0g0AfQqvnX+tyro84hlKJEsP
         8/gFRtH9zxdJAIw0Kp0H24E/2c4xCMp12qEO6PJpOzfcavl5kJLGbwG7tu+8INfxHxM+
         4VgdtfkI9x9JaaeqT19PHkkkUBIZx8e8qKP3mU2lSDTFUX1rA2OuSDupEN0c4cV6WHj8
         berYZdssk7Ixaj8Gr3pWe8vs67+YmI4MPDYnKfdvAlLFFsfKy2UdK1lLHvLQvSEMLe71
         a+5A==
X-Gm-Message-State: AOAM530QwnYn+NZlGxD6tjAqIpFeNByV6S5zCXUaE0zPISoZkziSax6k
        S29YtJEq6qSmN5Tvm5UdHrv/J2npiq8RCvfMRazScw==
X-Google-Smtp-Source: ABdhPJwaFh7ZG1oXVDdnC5mLW0Wxa/KXRkx9vch7z0UZRums9K3SwJojO6qJ3O7IvZv5hafotBx3MIaUMqojTPrsVog=
X-Received: by 2002:a05:6402:2752:b0:41c:b898:19a6 with SMTP id
 z18-20020a056402275200b0041cb89819a6mr23381311edd.30.1653300765781; Mon, 23
 May 2022 03:12:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:640c:2cc5:b0:153:d95a:3c5d with HTTP; Mon, 23 May 2022
 03:12:23 -0700 (PDT)
Reply-To: stevebrucefss@gmail.com
From:   Steve Bruce Financial Service <camila.toledo@uc.cl>
Date:   Mon, 23 May 2022 13:12:23 +0300
Message-ID: <CALeUmqNxzsFDTScjrKzqa+eamJo4TPbP3_nW7FuQHONsToSrwg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Steve Bruce Financial Service is giving out stress-free loans to new
applicants at a low interest rate of 2%. If interested, kindly apply
in person via stevebrucefss@gmail.com or call +1 (815) 771-5090.
Thanks
