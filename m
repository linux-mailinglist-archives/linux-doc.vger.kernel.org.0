Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985676DE972
	for <lists+linux-doc@lfdr.de>; Wed, 12 Apr 2023 04:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjDLCdO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Apr 2023 22:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjDLCdN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 22:33:13 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B2F40D8
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 19:33:11 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id w11so10540908pjh.5
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 19:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681266791; x=1683858791;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7ZMAe08pa3yftUB4lm1DUg8EjCg6JbDyenNfQYXhuk=;
        b=neBHAraeOkLRNuzf/pqZigbSGg6l8jbHXxaFnRIsBQG3G/iTHP2avQPY44ZiZAfjp6
         4B8LFgo920EQbKBaE+bS6hrSn62AHHcLTlGAzXOsE0+7/H2WUBtJjR39NZPRok/Sp0Ew
         hfAZ58iTNWCZQhntF/7NArDd8aBhjPU0E6NRXm24LkrW6I49ExTf4wpIo6bBy9HSI/s9
         RHUkSZ0Y8A7qZVqmX7BM95DRK4PNBApd0frjkbSpYVTS2ELjjc6OCzYFSDvYNCHENVZK
         xNlN7EEQcgAS5wSYPR0cy83B/XdNn1P9ka9JVTaour4x/yA36nrSF39eqp3qobZiMCq/
         QZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681266791; x=1683858791;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7ZMAe08pa3yftUB4lm1DUg8EjCg6JbDyenNfQYXhuk=;
        b=ZIuzZQE5tL3ya6nTDr62Gi+IWI8hXfhQ/TORUrgJqBxiNWwVhYtCCMK63kkpH6W6FZ
         IiMzZhEgJ3Vn70qxmBgbeySUPX2OB6yMauXVC3CGvLujvQPnhSZqkoweyzslO/6kAnNJ
         poIdx+Vju+1fiQAo/ZUPUwox1BoVlwQ4twxpU+NXMhBYy/EbMPjKDaGV7G2bnfPoqzz2
         Xmc1mJAv/zJEpxeYehdBdOGvVdUbFnh817voHspw2Kv2KTmFlTdTyZ/iNyFNbvarl+Rf
         HsfaS6DUldf7Ejz5yjCaNS/CVUAef2uwLGWXUtQLCKE97zTovEaOKKkvfnt5kNsbqL+L
         36jg==
X-Gm-Message-State: AAQBX9fMz84NSVBtrntlnIDv6GQGC1FMQwCgYUyqTVjd/tpv+YwqonUY
        QYkt6WKAzjbA79rkVZx4zQrjXgKip0RtkQwpYig=
X-Google-Smtp-Source: AKy350aNyOB/vHJr3ZI6DSGpT77uMZtfSraBg2oFr+/ZuhILprXg5NJXOx2VIOixJDxLp3hA5+Tt3RAzErpSoReWiDc=
X-Received: by 2002:a17:90a:bf90:b0:22b:b375:ec3f with SMTP id
 d16-20020a17090abf9000b0022bb375ec3fmr20061334pjs.21.1681266791105; Tue, 11
 Apr 2023 19:33:11 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsamina.kadi46@gmail.com
Received: by 2002:a05:7300:2d2a:b0:b2:ba4:48cb with HTTP; Tue, 11 Apr 2023
 19:33:10 -0700 (PDT)
From:   "Mrs. Bill Chantal Govo Desmond" <mrsbillchantal.govo@gmail.com>
Date:   Tue, 11 Apr 2023 19:33:10 -0700
X-Google-Sender-Auth: ZkyNSIdrfGr_PRdz4P6-VIdT-1c
Message-ID: <CADuGaS_3j-=pY3CX9fq=Dszp+d+Pqwi0H51Cr1w=CwRrpqDD=A@mail.gmail.com>
Subject: Hello Good Day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_MONEY,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Good Day, you have been compensated with the sum of 3.6 million
U.s dollars in this united nation

The payment will be issue into atm visa card and send to
You from the Santander bank of Spain.

We need your address and your whatsaap number.My email.ID
(mrsbillchantal.govo@gmail.com)


Thanks
From
Mrs. Bill Chantal Govo Desmond
