Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6B466D1CA
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jan 2023 23:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbjAPWbT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 Jan 2023 17:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjAPWbS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jan 2023 17:31:18 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACF7222E7
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 14:31:17 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id e202so8497837ybh.11
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 14:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl4uCsevYvl21DFFHHfHpz/TY+Y4NdyKB4ccoVr7FxM=;
        b=chY1LYkc3H+7hwj/BzINosPDLnW4BQC51NGqOsPgzOmsrQGibOT529CWVKDRNgZt5I
         KJ0MuF5E3JcVVQ2T7wsSl+cZPlwEC0rLS71jtCLN4GB8zD/2Ch+fJCIvtL39dxavyxIA
         vV3b92qomL4uJ01lIhnK++fLvunoAnIwDLNjG5u3aZQ6blpD9EUx5CkvorGV5xhJmej+
         OETGuRCgLXW5njpfaCItvXGrAB9kxp8rVll+SHUg5ZQVeNcnd2QaK8QysWQj1V1kuqO5
         ImeLHdGsxi6a+d83eMCZul4HJ7gpirnbI4QqxLwAwkQJCsSpwM3b98wZdY2LgB1BgkU3
         gq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nl4uCsevYvl21DFFHHfHpz/TY+Y4NdyKB4ccoVr7FxM=;
        b=t4srFm506uv0YJptetVPeeLqJCiMYl6r3ie4QoNeFZcoBxFSPJhvEQz3+IAzwqI4h6
         v9u8+yIVZVgWPYmeIkAAw4PjJW6VvGVinXP2mqtLYg+ubkN1PeQdcfrDAY8LKuU0MBMA
         YJ/9Vwd2VNm6OVWrp67AT7N6T1Bz2nY5pi8Gv8XXV3Xpb9kKOzrRogNYY6L8JjxkikjX
         MTQXrUEwi3DQPWkR815IF/o8+mItNCLSjKrx5nx+ujY0W+MuMmNNWlC+7mpw/1k2bZI2
         YegFwag90LNmvpgWlAC85kLRceol+WJxXlYNxyeEVHr8Q4kS9uy0ivzwLOCkEkdtVYGm
         /bRQ==
X-Gm-Message-State: AFqh2kpn3ACat3vbw0ccG/vfY3a3Pc7GY9IZ3pkCAY6FqrgQo1IfYB5j
        nMc3s1nOsqPiP2RqDk6fw7X32YaY8+gNrirTN5E=
X-Google-Smtp-Source: AMrXdXvlLUCfc+dIq+S5LzlJkLbG4mALH7IbRNhj0nlEsjsJBFMxs8d/8MZNFKA4yVyRrZU9kxbh9sXILnOYWi68GBs=
X-Received: by 2002:a25:3309:0:b0:748:8c22:b8ff with SMTP id
 z9-20020a253309000000b007488c22b8ffmr134104ybz.468.1673908276421; Mon, 16 Jan
 2023 14:31:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:959a:b0:104:e594:6d5e with HTTP; Mon, 16 Jan 2023
 14:31:15 -0800 (PST)
Reply-To: stbzan@gmail.com
From:   Sheikh Tahnoon Al Nahyan <ahmedkmohammed10@gmail.com>
Date:   Mon, 16 Jan 2023 23:31:15 +0100
Message-ID: <CA+KTRHRDZh5FS8X3HxF=KuvQ72EeDEP7R2BBb76c-hH6JsaONQ@mail.gmail.com>
Subject: Hello sir
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b36 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7516]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ahmedkmohammed10[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ahmedkmohammed10[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Hello,

Hope you are well?

Would you be interested in a possible business partnership?

Please let me know.

Regards,

Sheikh.
