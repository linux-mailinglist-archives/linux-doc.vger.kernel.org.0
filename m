Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0578F67A129
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jan 2023 19:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbjAXS3b (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Jan 2023 13:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbjAXS3b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jan 2023 13:29:31 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D9348614
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 10:29:29 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id g205so11820176pfb.6
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m54Sqk02Mt1LMUdykxm/xF11P0SJ2vDzS7bOVluf730=;
        b=WCeN0VmtScrmUWy6amLb59x+eTidcur0PbzMHFB0/vsFlptB8lK9SdVD2oxtvVJfa+
         j5krf2fsjnMp/KMQEmj549KV+ADG4a6fGiR0TsyL8w5i2XA++4R9chb/1G0bTlVDe/6l
         p/stsGPXZslnAkZIJzLzysZw5tkMt7bsGPRfpy9LD7/c0fuNAi0JAZ5qTvwAaIRn7FHX
         OCo8sM6MQ9GK9wnJOPFMD0/dio4cuDgeojSoHdeHZ/xSNSZkHNnSVrQopZLJNKRd2TVT
         2PWoVU0X7/6EaJ9EW/2l5XE0z7xsKvXP+8KCq8Xqm0HQyF+cidgIekaPfSIGmLOJfDma
         bABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m54Sqk02Mt1LMUdykxm/xF11P0SJ2vDzS7bOVluf730=;
        b=HNHmZ8rsXvfWb9/XoRszCBT6MM8H7Q4I/EJ9ioj0Ne307WLyvzJoXBmJWM/P44IStz
         GLYXu/2KtLRIS56cznACnD/hir7nI1y1NjFvCLBtfShDtZ3av6IKwuKqXl4WW/1lOxhL
         aSY7obwzzX3tfnqmkDGRk0SaaKELGKHB0x1tRLjTIwJq+zF4RSLdN6GTrfY0/wPGzZAm
         rQzLjwspiE8QXhTi5EAGqAzVc5x44lT9RUcs7fZBw25iqk/LpddxfAJokzTAjrIsD7gs
         0a9m10MVP4K+KCdZ0MQeoPrAb+K7U9x8dtgLoRIEeNtwlYrxKVtcD5pZl8GvFzlowQ6d
         0bOQ==
X-Gm-Message-State: AFqh2kobc+AQ4I0rU+xWbUti0BTsOt8sG9UBbn8aNGMkYsjoAf2HriTD
        +FYhL942DTEkYuDcLqCxf7Ipp3MPGyF3GjJCXgY=
X-Google-Smtp-Source: AMrXdXuuy612LOEGsVSI3HgHWfrmFF7BeAQLBvpcub6BjNoi9Hn2EfZXipyT7OMNjPfNEWQ0n5QF9TW6k+kj8jbS77I=
X-Received: by 2002:a63:234d:0:b0:4ce:ca5c:c472 with SMTP id
 u13-20020a63234d000000b004ceca5cc472mr2866754pgm.105.1674584968991; Tue, 24
 Jan 2023 10:29:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:b098:b0:97:d8a9:a406 with HTTP; Tue, 24 Jan 2023
 10:29:28 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <angelaemmanue@gmail.com>
Date:   Tue, 24 Jan 2023 10:29:28 -0800
Message-ID: <CAKpYVvC8kUaqm8sm4jtuCK9nM+8SyV6zZ_vR+tcy=BR38XhBcw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Hello, did you receive my message i send to you ?
