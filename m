Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852CA5FD609
	for <lists+linux-doc@lfdr.de>; Thu, 13 Oct 2022 10:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiJMIQA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Oct 2022 04:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiJMIP7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 04:15:59 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD9CA4847
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 01:15:57 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id q83so450868vkb.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=a9Pu8CgR8FSKchsTMQRy7hM9h2lLny14u6275xg9gFcfvefwobqukrJqpDu7gsULNC
         NyQILxvWDixhCeqXvB3+IBDk3yPwAU/pjSu1jydtfsJyC9ZFPlKKn3L4TbN4WNFkbAaD
         26cIXuGSsdKIlJ6mAUCi71QtbRl4e6T12jyYpRzkACPaKq+lDB7m+Ra6zH+gQGr1mlLM
         I86BQdfWzEdyDJAyNdEV3p0iuSr1XnauN5BHb08saxJYYFz+6Vg1lnD5tzfyMmTZe6c/
         towy+QCnOmdm4ghITcf9tEZ/TCQSUu1d7vN6ivsvL3pM3SqESXdjju9mzwTC/S6pCaA+
         1ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=juPQ5eJGwt2oLrEDg+QUnoJH+JBYb9ae1tsIoB0GOM5F08wWoN/7KhpaF7kQjp3Zkj
         nYowlOTlt13cqnUHSIwi73oL/DdzFMka/wPr3WF4syYWJRhkf8LMzfP8En2NSihpOaR+
         qyTCo2ZIljPa0u3nqqDwMYTtLFlOppCbjNcsYYT5bNmZXeiVdncSN5b5hyV6e0DQK2qq
         OS9e4qWyZYgrwML5tXUt+PWQJQesFNwYUrSveHzpREIy0WeQdKxDgLzk1hylg9GPmiJi
         JBa/zaJoEsKkN4caG9+MlP69lkGcscFM2Eck40ovM99z356KjyFH8QBHbjVjmrnL8fR1
         aquw==
X-Gm-Message-State: ACrzQf3G7vc47bDhg8JG2bCntArqXzuJ74QMcWegyKGCoM3QCV9oukw6
        AJxk4zJmxVLL0m01ZILiqCfZxYcHMuWlgHrgoa4=
X-Google-Smtp-Source: AMsMyM7MTRrrMnSNJbgLNeMoV8lmU+n+z4LhqjOImjAiUXM08aqAqFt8ZcPyiFUgr4qAVeUHIEgjxZuxjbSe5H0mOhE=
X-Received: by 2002:a1f:26d8:0:b0:39e:e116:59b8 with SMTP id
 m207-20020a1f26d8000000b0039ee11659b8mr16524157vkm.36.1665648956248; Thu, 13
 Oct 2022 01:15:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:f8d5:0:0:0:0:0 with HTTP; Thu, 13 Oct 2022 01:15:55
 -0700 (PDT)
Reply-To: seybasaniel@gmail.com
From:   Seyba Daniel <uchegl350@gmail.com>
Date:   Thu, 13 Oct 2022 10:15:55 +0200
Message-ID: <CAEOHcLBpBcP8sArkTbREE14Hpue=C2j7eGH3iNumC_Vp8qM_Ew@mail.gmail.com>
Subject: HELLO,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
