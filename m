Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B337545692
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jun 2022 23:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240442AbiFIVko (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jun 2022 17:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbiFIVkm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 17:40:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B6056386
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 14:40:41 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so517800pjm.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jun 2022 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=ZkYftyRGpMcveXvJMpgQmrhv/AK+OIR38U0gj7+k5ToXazsjt8DA47VgB7wH22vUOK
         M9aLAz6MZ8Ji+ZonR0ZSDY7evDSyDH0u/u0b+RCfUHZrlsu67gqbVifLnBg31WKMJxH4
         xcynhzC6bydaokSx01xdrt+i4Jy1OLTt/y8ZYV0y2McFs0hO5wCMkxJJMBWqCbWqsToM
         xP344HcvBx8v9Px/I/SS5E6eIKEGcjZe+HDvAiFszmdAZF8Z/nZKAzYf4hBT3R5qoqVg
         y+SnNDPebj5YKuwntNgQHSf5KgWpHGG8XE4Qlo3+wNXrLKiJXr5hbcwcAajdubUFRJ33
         l+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=3QDIvCtG2P2CrXx8hM5HM1qwNoAlk/EFt2ZXur8jc1OxP0DMB3J7STVMrCZzbn7DYF
         Xp3p/lxE1KaMu+X+BnnvTFZJ+4yeB1DFmXDnATXG/CeDESCevK1cabj+iL33rX42twyo
         KPukzMF4HWrv0gJdaFL21Di+Edslcx9eyDNT4iA3V0n60nwjJTdjgfgx7jPLUGfOv6su
         kW8LBNsF7eb46zqUaqJFIzEwgjYY0bPLh1TM7EIKzVYrGVmZA6H9PIGCCIkaslv1cAq5
         S0W7RcLbXalTmPo20reE8qE2wBf0Dwtga+n+NRw7vBK13GPIuPVphXUCfyi1fjdF0E1w
         6Rqw==
X-Gm-Message-State: AOAM531q3TAWmAT3mQ/1hH6/taogHSQZ7ITmb/03sK/m0bT/Vq3qunZu
        54CjThgw4Eb+MPDnPTAyRCz7rfKJ0LUM8nVem/E=
X-Google-Smtp-Source: ABdhPJyvXzC7vzoiAK5Hno87Wsj+tz7diAQck7L3KllSWvCqdiCm6FzxfaW7MwzjdTVidsQ2kFUxqe/C4WwHSPk5zDI=
X-Received: by 2002:a17:90a:14a6:b0:1dc:f64f:ff2c with SMTP id
 k35-20020a17090a14a600b001dcf64fff2cmr5310519pja.161.1654810841155; Thu, 09
 Jun 2022 14:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:902:8345:b0:167:8960:e2d1 with HTTP; Thu, 9 Jun 2022
 14:40:40 -0700 (PDT)
Reply-To: wen305147@gmail.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Fri, 10 Jun 2022 05:40:40 +0800
Message-ID: <CAE2_YrA41yWrKODFfwcbqBbUpXMTLrM5z10qZAzkP_7r3_uvOQ@mail.gmail.com>
Subject: services
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Can I engage your services?
