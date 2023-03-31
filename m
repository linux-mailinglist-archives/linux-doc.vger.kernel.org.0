Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13336D1EED
	for <lists+linux-doc@lfdr.de>; Fri, 31 Mar 2023 13:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCaL1c (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 31 Mar 2023 07:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjCaL1b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Mar 2023 07:27:31 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61851D2E7
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 04:27:30 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id i5so88487697eda.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680262049;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvVBXZsWUhRTexhKjd3TloYD9bYfy6NOY43HMkgs7w4=;
        b=Px1sfUz6FxM27ZW44toZWMaDg6OHbWUOtn9DLDimWYyzwzQ+A+qLe6gmxFakrFsL0G
         9qcOlQcydKwKkbNIxEXIMKX4otCOlu+MJWBfbtvQIX14wb8GjL95gs85jbDWXRJ+7lWN
         sPGpydPF/Wh9ovuBVFjzYaBLD8xhQ8LklZl31Hr/kb0BcxJGQau1JyHnLoDsUwoYHtJ9
         ul+Z0ANETzJud73AeMJvUikXMhXkfhpsi/i8JQlD0zct1AA1y/0E0meCmAdFKRTtgxyx
         AfwRkxVaSlqWZsRaV/SKWv11c3tzYs6dDyfcWVECUKwJal4t7y+tYXrDk5+scZd5YINu
         cyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680262049;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvVBXZsWUhRTexhKjd3TloYD9bYfy6NOY43HMkgs7w4=;
        b=FXwd52NqZmnvG+pWE3FrlB8aw8YIu/yByjWLBKCds3Vhd19rZ+2+NyDKvfVe6mjYg1
         zfL80TpkYxdOyWCRq1a+rIEDuOQcCGqv1O1/2wO+UzHYT6GHTOTqLYot8F6NBV2jAZeg
         310I3dL1janRO6kZitmQsaAByfMMi3K3Uzv1aO2uVGZQQeOZIBnydIR4pIyl2cxiEi8z
         AwFbbvg4I5kCEKVIO9y/xs6r4GM5t6lM8Yp1SXPZr7y3LnxVc1otS99v4w+m300tp4Vh
         Qr0Q2fj6EHlI3ojMN7O3Hl4sZ8CDzz95AWkdTJIXHubA/pRJAUhNE0aF7hgTZe6DdoJa
         mXig==
X-Gm-Message-State: AAQBX9cRp5yqh2ippNTiiwD0kkaQ7Pdds8Y941aS8CVx8pkhKkrV5F+/
        Poe1AhbQkXF4CaHHR8gbPaKgjXW8dxmTO50ozfI=
X-Google-Smtp-Source: AKy350Z0QBgzRKUjCV4C8U7Nf4E0sBQfRKNpYhXTQgJHeL7DHyI9FNtUvjVBUYg82RQIbEvMmf+fKK3uqM22aom6JQM=
X-Received: by 2002:a17:907:d687:b0:8d0:2c55:1aa with SMTP id
 wf7-20020a170907d68700b008d02c5501aamr12304786ejc.0.1680262049132; Fri, 31
 Mar 2023 04:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3b4d:0:b0:200:8c6e:b61 with HTTP; Fri, 31 Mar 2023
 04:27:28 -0700 (PDT)
Reply-To: gb529585@gmail.com
From:   "Gilbert . W" <rachidatousalami1@gmail.com>
Date:   Fri, 31 Mar 2023 11:27:28 +0000
Message-ID: <CAGzS2OEw2z6-neq6QibdjyztVe7ZAu=wBA8a4w4LH5KiKgaO=w@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52b listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [rachidatousalami1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rachidatousalami1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gb529585[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.1 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=20
Greetings,

I'm Mr. Bryan W. Gilbert from Turkey, I have a lucrative business
proposal of Twenty Six Million Great British Pounds for you. (=C2=A3
26,000,000.00)
Kindly get back to me and I shall send more details to you.

Thanks, and God blessings
B. Gilbert
