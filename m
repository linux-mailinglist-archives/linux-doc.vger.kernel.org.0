Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB035EBBAE
	for <lists+linux-doc@lfdr.de>; Tue, 27 Sep 2022 09:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbiI0Hhm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Sep 2022 03:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiI0Hhe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Sep 2022 03:37:34 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0786769F4D
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 00:37:31 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id e68so8975924pfe.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 00:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=W2hJLXZEpV+2eqAKMNoZcDhofs3a0fuyhAGVXRo+6bw=;
        b=HV2aiRfB7j2HuSCGbeaG8xWOrbAAAfT66diyqRtVCxff5bV/waDkXk80TCe8Agw+HR
         n8iRedjkAZtjUPXhN5LOz1gwEyW3phDWstVjIxIy6tcfXb1IaRsaFu3kIRXlvpIrEObO
         0zTpda8yukRNAjkYVffy5vLVqyv+YjLVM7aOvAaf2zfRAT6FTLz5IJeuM2jGHPlTP1uH
         oHdpwUlwF9uKKijdalFx1H1XOxwJDB7fq7n0qjLXiQVlLRgvdhKo0boPDRUh7Yw0gC8w
         qUNy9mQyGufeXvMY1HWmAJ6yt6xOcLZvnuE4UbI0AtEYgG3lNW1iblk+yYDqz4nQQ2oD
         ewIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W2hJLXZEpV+2eqAKMNoZcDhofs3a0fuyhAGVXRo+6bw=;
        b=oHOoYIlUzLdT5NEK0hGdzftIXuLJElJgaWUZlGjAw143eTh27mqvWnQ1q2PwKqvFei
         WLsBnQiHA7CheQTpSoUZi4MXlK45lYLmH3cdIrN4Z2m5rwsYBCu7BZrHRuChHga7tx1K
         Y3wVVVjACpDpOZmcJvfbAhkYUF0WAXzoWj/P6MEFPAiOcQVonQQ/w/6GbDj4qJF6rGyq
         LVbL5AsAZCWHUuv+RKVd6QXT+tBvYW4rve87lyK9qluU9qYbupeuXxAXBVc/YeBNarSd
         ModtE7Igg5vVvlE/nE8pqvAOPDB4ZwFqxaDfkNBI/q7EXBVGm6T0JrGzBgHDVVoUHa45
         sX9Q==
X-Gm-Message-State: ACrzQf2crEZQnt/SFDBFEIVhkOBNaascDCmzcR7w/+sBazU0frGLf3uP
        nhScqf7UTCauDWXS/DO6S6xTbDusN0gPyAt1Lyc=
X-Google-Smtp-Source: AMsMyM7c7wgd9OzrVTQ5mWvrzUBWwUWYdREQJQ3w3wQcWpJsQT5nlfVk3cr+S8oMWcwXLcrXHnc3Hy6DA1ypgXBrkcY=
X-Received: by 2002:a05:6a00:1951:b0:54d:a413:7c68 with SMTP id
 s17-20020a056a00195100b0054da4137c68mr27952396pfk.10.1664264250512; Tue, 27
 Sep 2022 00:37:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:189c:b0:6f:2236:258 with HTTP; Tue, 27 Sep 2022
 00:37:29 -0700 (PDT)
Reply-To: stefanopessia8766@hotmail.com
From:   Stefano Pessina <georgekadatsa@gmail.com>
Date:   Tue, 27 Sep 2022 10:37:29 +0300
Message-ID: <CA++jw3ZGw8_chr4U3BVwdzKHa9t=ctL_47Nt-3UAPnfQ2ASrtw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=20
Kwot=C4=99 500 000 $ przekaza=C5=82 Pa=C5=84stwu STEFANO PESSINA. Uprzejmie=
 wr=C3=B3=C4=87 po
wi=C4=99cej informacji przez stefanopessia8766@hotmail.com
