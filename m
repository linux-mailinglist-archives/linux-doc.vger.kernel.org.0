Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9A9620E73
	for <lists+linux-doc@lfdr.de>; Tue,  8 Nov 2022 12:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiKHLSa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Nov 2022 06:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbiKHLS2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 06:18:28 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD422F40
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 03:18:26 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id 63so11165201iov.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=Gd3mKmpUViv1Z1mP0FxgiIq2Z0flmoayvmnItgmPMOwfnfO7dbMVgPMHHLQqWyzA4u
         lfEmvGbla79hSWqu/qei9kGExaoW1Rb5bNTfQZUazQPV04X/QE5ftjAj8f74HamD5xlY
         oQfblhcLvaQMZzAR59JBC3JsOfyVYbdyjlnpMsMjjXhSXqq7arSb0HSQlx8OeL9R2OOk
         IhdDHwbWE5DfGv4PT24RHlFa/31lxQnjzTVZVUQK1LbMJwqPPsF9Ao+zQgi8WRexrNJ7
         O8IeUOYeRqHHasRyT3HQt4zyYQRlZ+h94b/TbrJ0XYx/5dxn/CXV556ynlIOFg8mOgph
         tefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=REYRuGEa83XWaTlUJoebT6w0UP7W5IXqYqtTppskh4LYvD5vkADhtQR9M4iDOB2ie7
         xJrAgfA+mrHGT+77hYKryEiy0eqg7fn1swZV89MsPGgtybiIhbe9AOOP3pRBpLInRGXG
         FPehX5uNlmG2XgqfAyed/iBSVnt+t6gsUFkf8Fy2WcPn8G89+H0DUimS+rvrNl7OkbKh
         SOPddYK+UoiNsNPbQJquIGbscJZfSX6c5Ca3b6nqqIpqc1I9F0CTDq+RKL2z1wykKgfv
         IcIBAKjFH8IZ7XgdP+hHInxL7q291z0lGfjiBPKkmbzbpPm+jJsN2MzAAPKIXJjyDPAr
         NEcA==
X-Gm-Message-State: ACrzQf0ErwfbmpHeKDkfsrX6vFnjIoN49M+IBnnrLEgZV8IdBfSm/9Uu
        yVSAiyHiqleF8rMDCb2R+dj8pPsi+hke0ugekTM=
X-Google-Smtp-Source: AMsMyM6MSt7jdLRy+pjMZbZwT/jv2EvzYN71MK8pUHDzumFlLUM+ojOYFLF9EmSiFuuNARbbB7/emApqddF973mLsRQ=
X-Received: by 2002:a05:6602:164b:b0:6cf:bc3f:fcd5 with SMTP id
 y11-20020a056602164b00b006cfbc3ffcd5mr30189353iow.119.1667906306133; Tue, 08
 Nov 2022 03:18:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:38a9:b0:375:4a9b:180d with HTTP; Tue, 8 Nov 2022
 03:18:25 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik1@gmail.com>
Date:   Tue, 8 Nov 2022 03:18:25 -0800
Message-ID: <CAKfr4JWiisOBWHkwui6wRuzv+6yWiNVf6ZZ6x2FXoWTpVc9CjA@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5072]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Dear

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

Let me know, If you are interested for more details.....

Regards,
Andrew
