Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10676EB822
	for <lists+linux-doc@lfdr.de>; Sat, 22 Apr 2023 11:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjDVJB2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 Apr 2023 05:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDVJB2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Apr 2023 05:01:28 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDE11BC2
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 02:01:25 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-38de3338abeso1700674b6e.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682154084; x=1684746084;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1bEiNpfNWaupTJq/MT6CaNCMwtQHUlCN6T2ayUv+NI=;
        b=N0vumqziVkWywCz27drrkoLiX1UyRFN3Rm6kCAG+ItZokXoYycwGbLyRacWYwYx17P
         d0kB5ehKRsdD4dpoq/pWo4qeZGpHUGIIIev1EJZCABZNZXCltIq5YcGBdtkrSflc+ji/
         PKBiSFsXfW7RTrJxCzrJjTc/SOn89GvgdY9x4ZkmAZQOX+KIAhgdUF08eZwrjPU+Hi46
         7ONt6gmbINjMhdLx5qTchJ8xzWvJXLeEcYwhNCrLd1KqOoaC7hjWLztz8bsT7h5H2Mpg
         zbz4Ap4cPdL3Ewsg8PQVd7BX4lucvT/1W6Yf89vac+Qibk3SPVOtxgtZ2eLkUrCZDNY5
         BvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682154084; x=1684746084;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1bEiNpfNWaupTJq/MT6CaNCMwtQHUlCN6T2ayUv+NI=;
        b=IR+hnMBVkba12WS2LBJSV3UTGpJElH5WmR2ajEomgkDhdJFWaj9m2/m+TCXaUWreR/
         6vJarClUWevdBbsy8y5yvXxiQ4jE8mI8taBjc5IMfB3rOqxwrupLOpHq9yiwjgj+WGo2
         vFxIB1o5+tMZqZZwQ3rOELhsj00EyBvYK0rTCwV0JfY7N1cSCczb4T859dJYaiZ+1I7J
         8bCOtJFgDgbQtBRE1Dmm3TuMk4bN2CfG57bGAZkWOp6YVVVatySaX41NFabk5R/Ikwtv
         wwqVsnHNsyEKuiRTJT8BrEeL2rJ8Fu3RRjF/q7ONP2zOG7VdWsjFluKEtFqpVfI7cYIT
         XxNg==
X-Gm-Message-State: AAQBX9eMRpEWiC95ALQGVLYQGEY/xp9o1tdnwIdysZS1UTLB7uEmmJ7b
        B1+Q5OnXWBFXOHQl8PsZGs9yTYlAsdbbGgnUfj8=
X-Google-Smtp-Source: AKy350ZQUQKrUW+IZk841YScEZ9NgRy5XpoQHSUMyF2D55Gtp90HbG7IPIDCrLjd/XH1CVGN8H/Zgp5+ZkrZ7FkJhw4=
X-Received: by 2002:a05:6808:120d:b0:38e:365:305e with SMTP id
 a13-20020a056808120d00b0038e0365305emr4674999oil.21.1682154084480; Sat, 22
 Apr 2023 02:01:24 -0700 (PDT)
MIME-Version: 1.0
Sender: namaroismael54@gmail.com
Received: by 2002:ac9:6157:0:b0:4d0:8c5:9f3e with HTTP; Sat, 22 Apr 2023
 02:01:24 -0700 (PDT)
From:   Miss Marybeth <marybethmonson009@gmail.com>
Date:   Sat, 22 Apr 2023 09:01:24 +0000
X-Google-Sender-Auth: suyP-Ly5f7aZhWKyAwzoqhzTBng
Message-ID: <CAFXq+JLhev7wQaWrfGa_=5P8_HTeVJnpeOx1ExBTnLuV3rucdg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hola,

=C2=BFRecibiste mi mensaje anterior? Me comuniqu=C3=A9 contigo antes pero e=
l
mensaje fall=C3=B3, as=C3=AD que decid=C3=AD escribirte de nuevo. Confirme =
si recibe
esto para que pueda continuar,

esperando por tu respuesta.

Saludos,
se=C3=B1orita marybeth
