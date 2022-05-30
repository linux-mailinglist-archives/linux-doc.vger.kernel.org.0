Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B905E5384B5
	for <lists+linux-doc@lfdr.de>; Mon, 30 May 2022 17:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238239AbiE3PWA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 May 2022 11:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242696AbiE3PUm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 May 2022 11:20:42 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F151C12F
        for <linux-doc@vger.kernel.org>; Mon, 30 May 2022 07:22:34 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id n145so11475279iod.3
        for <linux-doc@vger.kernel.org>; Mon, 30 May 2022 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=qKp9S3u6d4f5TEN5jhuy7WIYH1EVaz6Q4QHh9bdZ28VKoSNkMpctdiK5yl7HRyXvEb
         llYmuW3/eOyS7+NZPAr7hwcxhcPEjJJyttFUlRPOfeiJF5l3EWI4/1zHgOixeQ36a5lD
         CuK5prGxb/lkDZDWRFwnA62ErigUvSuk4LA+N1QxXAlP+mDHxz83nCR/4s9ToUC1Xpg6
         UEgttcYY2bkX/pPhuN4top3XhfEj1PWi3lnMugYkJb2BQtWmipvBOgQxpcynKR9aeIXc
         6Ub9RFRs+VtjCqXM/v6bc/ODLVXZ0hINUfK1dyGWQPEv3zWRb6uxzEPx5xAl5yT+b5Hr
         7MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=fd9kn0B/s8gVFwTg8Q/yZ5FDx6D0pN2yvKvAEN1xNmc2la2oKhR23UlH6vKYjdWc5/
         oyg4mi3uVLU+RoOsXwR8xc2NVbEX9eKKA6TtFK2/cVJMq3xbQPgeG3RwgyucCtB6xEQ8
         00VNWyaPe4KybHF2NIeaADuoieAg8bxuW2XRtx7tfaBVIrkMv4ubpVfIEDRmzSk41cHT
         LKAPpNAnRo3y0u+fOc3fOLZh7/P5CSgso99SJ8sVaRYKID2ehZ9H89dhTEAHXEqTQNHJ
         CwKU+T/T/SjDvdpl2b8JIhFiepH/MmagfoEdYtzHXWeapVcBVzFjns34bKNjJb0H8oOY
         9hZQ==
X-Gm-Message-State: AOAM531i8T495+cPAoEh+6fS0ob5TZZysZeBnwZngaUPsbppCXUeIA4e
        5saIV3agIso+dwWz79+MGVUe/1wn83deLnhH7AM=
X-Google-Smtp-Source: ABdhPJwc8rLyNW7Em0/jVe/pHtoKDyTVaZXWUTUquAQGYQl6yIktTEJQQLGYR0h54N466jsQxTZLgVt2wPFwUK1B7/I=
X-Received: by 2002:a05:6602:26ce:b0:649:5967:ca14 with SMTP id
 g14-20020a05660226ce00b006495967ca14mr24922770ioo.97.1653920545139; Mon, 30
 May 2022 07:22:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6622:f06:0:0:0:0 with HTTP; Mon, 30 May 2022 07:22:24
 -0700 (PDT)
Reply-To: barristerbenjamin221@gmail.com
From:   Attorney Amadou <koadaidrissa1@gmail.com>
Date:   Mon, 30 May 2022 07:22:24 -0700
Message-ID: <CAOh7+P9efDeS0kG2DgVEtOSOdn7-PLL2Bi=Kbs5n6A6iu8xObQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d44 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [koadaidrissa1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [barristerbenjamin221[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [koadaidrissa1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGVsbG8gZGVhciBmcmllbmQuDQoNClBsZWFzZSBJIHdpbGwgbG92ZSB0byBkaXNjdXNzIHNvbWV0
aGluZyB2ZXJ5IGltcG9ydGFudCB3aXRoIHlvdSwgSQ0Kd2lsbCBhcHByZWNpYXRlIGl0IGlmIHlv
dSBncmFudCBtZSBhdWRpZW5jZS4NCg0KU2luY2VyZWx5Lg0KQmFycmlzdGVyIEFtYWRvdSBCZW5q
YW1pbiBFc3EuDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCuimquaEm+OB
quOCi+WPi+S6uuOAgeOBk+OCk+OBq+OBoeOBr+OAgg0KDQrnp4Hjga/jgYLjgarjgZ/jgajpnZ7l
uLjjgavph43opoHjgarjgZPjgajjgavjgaTjgYTjgaboqbHjgZflkIjjgYbjga7jgYzlpKflpb3j
gY3jgafjgZnjgIHjgYLjgarjgZ/jgYznp4HjgavogbTooYbjgpLkuI7jgYjjgabjgY/jgozjgozj
gbDnp4Hjga/jgZ3jgozjgpLmhJ/orJ3jgZfjgb7jgZnjgIINCg0K5b+D44GL44KJ44CCDQrjg5Dj
g6rjgrnjgr/jg7zjgqLjg57jg4njgqXjg5njg7Pjgrjjg6Pjg5/jg7NFc3HjgIINCg==
