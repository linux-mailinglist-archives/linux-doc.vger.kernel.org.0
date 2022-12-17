Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F36FC64F926
	for <lists+linux-doc@lfdr.de>; Sat, 17 Dec 2022 14:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiLQNxs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 17 Dec 2022 08:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbiLQNxp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Dec 2022 08:53:45 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0100C13F4E
        for <linux-doc@vger.kernel.org>; Sat, 17 Dec 2022 05:53:45 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id mn15so3452195qvb.13
        for <linux-doc@vger.kernel.org>; Sat, 17 Dec 2022 05:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=V2d2nr9Uy3v7gvwKAh48C4Xrzg60hVrvVE46Yk8BSZLL0CxRxIDSbj7nxfR1Cd7oMI
         DG+jjy2jUCkC4+MJ2xKUqaD0vEMAx8XvBNZMzD6akOifZiRIYnjA0v+vOX9IYYtfiGpR
         hjEyDYd5watcwEfpu8Lqb1ydG35Dso2qKSr69CK9mW3+x+zoQ+fkRvKZoMc/vLhF+TXc
         zmP/vPtYdQXhkdYzQkWNaj1d7KYAMKlk+DsydRbgi7Cxz+En4nseKrr+VyzQSYuBfK1S
         DjmvnHh6tMa0ZzMx+/qnme1axUfNm0dNbdqlXJ4Kx8dKpZDVTOhGkA+IBYyH7+SucWDv
         zGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=3610hKHU3Ptuz1uqaKQ4lSm89B/PLL+zghYBUNPaqKuEPbZUdM7WqdYTbsplFTPBwT
         z3ddXYp1iSa0SYdbnyDnjeO7Kwdk1Mg/FOA+PM4Lvzz26YcWT5qdfQbxiDT0gOh8NZMp
         7Zvv7oXRsHP5QOXV6w9NehoCkjc7OdEbAmhDrsUgLq8ZbhJGkh0ByCjjoAmxrMtzP5gk
         VQQsajafEWeFLg7JgApwrUJ84Nj+HlILy++8oznGJuTmGe0PulxT938sufkAovzP76a0
         /SDj4f0PG/nEni1clhoVQ//icN6CjRaV3qwdfsY+S2KuDeYUDzot3v+aEXQ07uKCbQda
         EVWw==
X-Gm-Message-State: ANoB5pmXJFfDoXwQk66hsQ6hKs4prC4qIThwuBjpwxUfadCpKYOx9Vyb
        /o7PiBESwlOI1d55UIyuEc3E8dOQeBXkaSoV1/A=
X-Google-Smtp-Source: AA0mqf5yJxn4123E10ZLbK1/waPRMIX2ESXaeXDFZHm1QAu2wpFhT//JWWyFyaG5+q9bpqPsRxJFyg0boweGhYIXwnQ=
X-Received: by 2002:ad4:55cd:0:b0:4c7:57af:c44 with SMTP id
 bt13-20020ad455cd000000b004c757af0c44mr20844776qvb.98.1671285224000; Sat, 17
 Dec 2022 05:53:44 -0800 (PST)
MIME-Version: 1.0
Sender: asfiss2018@gmail.com
Received: by 2002:a05:622a:38f:0:0:0:0 with HTTP; Sat, 17 Dec 2022 05:53:43
 -0800 (PST)
From:   John Kumor <a45476306@gmail.com>
Date:   Sat, 17 Dec 2022 13:53:43 +0000
X-Google-Sender-Auth: m1CqU5AiiP1itgoeiFuLN7RN92g
Message-ID: <CAMhHx79EHyp4tHD0qT8USgOtbv-8jS3XksF1qvJN3BVd=P+Q4w@mail.gmail.com>
Subject: Kindly reply back.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Greetings!!
Did you receive my previous email?
Regards,
John Kumor,
