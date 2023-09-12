Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1056B79C3B0
	for <lists+linux-doc@lfdr.de>; Tue, 12 Sep 2023 05:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241431AbjILDGk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Sep 2023 23:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242260AbjILDG3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Sep 2023 23:06:29 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF4D60538
        for <linux-doc@vger.kernel.org>; Mon, 11 Sep 2023 19:42:26 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-58cbdf3eecaso49376567b3.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Sep 2023 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694486546; x=1695091346; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y5Bc2tifYwsUo41wPPqLr+8IDVVE11kGS5POicH6KL0=;
        b=b5kc4v8HkrFb7E6FT4UIv788cQB971V7aSirMI7oHXlEDTmKNmEnqDG76HgYPChyKE
         i3Nj39pDcFU7cRqLNussRB9QW6jEgdEeKD5fFFY+llzSJSvKorc2XPp1hbhm73cKvnxP
         6+TnH/s5NgufqS7EQB3j4xvW+2VoSvk572p0KFQHp43B4x37puCOIEsy3d8HgczdRHhM
         TgPS9/ticRLNUBRLK3VGVIrK8GXaCX/n2RNFIX2LGb25UW+9ytmqHDrtCB98NttRETMW
         sL1oHT+N5w9I/dtXEnlmf10fASndLLNpX4vHg/23dXohkXmCfaOd57G5uquYfv84TdNP
         Ze5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694486546; x=1695091346;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5Bc2tifYwsUo41wPPqLr+8IDVVE11kGS5POicH6KL0=;
        b=TafzbTSuhOvQvS/kxSUqRazQNQ9ZeE52gH6ZKyo07TNmdnGFFrovli/EdXq2REG6ak
         qG0fV045F71pT7yoN/UIxN7/A5svfRrDHBaOOYe3n8vuyvsCgY/YG1uWOhR1kbIOMbyX
         yUMeg4nVRhmGdBUC00R+e0AD1Ys+4R99QWD9m7jGHQnmC5z0dwAihFCr0qiJG4GTXF8c
         8i0TsrPLqw4WyfwTM8g/V5Ry1Z9PdINHh9Mo0jbY5P9MK+exZzh40V/1qGyS1n3WtxnV
         LB9V2enl1riuc0PZUxSikDoHZZzA8f1aQbAwB4q3SA+5jRIcSz+73BJ4ZnCxr9WtJz9p
         cTrA==
X-Gm-Message-State: AOJu0YyGfyW7rnaA6t02A7yJ3PKYclyqAm3bA+wabPUH7jOoQf2QC5Yt
        4LSf0yvWCoOF84azAlyqipfkGy0MOBASeF71UVQ=
X-Google-Smtp-Source: AGHT+IFvzOUZdlNCzBPYuCOFZUcznrrw5tTIpHbUEQK4DbbY5mA60avetFYr+FSxeZDdHEbAerbJ5LPEyz2aWxVYjGY=
X-Received: by 2002:a81:a106:0:b0:591:15a6:c11f with SMTP id
 y6-20020a81a106000000b0059115a6c11fmr10841740ywg.50.1694486546159; Mon, 11
 Sep 2023 19:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6918:d14e:b0:1a6:639e:73ee with HTTP; Mon, 11 Sep 2023
 19:42:25 -0700 (PDT)
Reply-To: rosarioshdra@proton.me
From:   "Mrs. Rosario shailendra " <rosarioshlndr@gmail.com>
Date:   Mon, 11 Sep 2023 19:42:25 -0700
Message-ID: <CAKU+M=PjiVK36jfv37vxcNGbPuQnhyz6Kz_4qJHJ4KVnmk8oXw@mail.gmail.com>
Subject: Dear friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dear friend,

My name is Mrs. Rosario shailendra I am a Ukraine Citizen living in
Cotonou Benin Republican here in West Africa, I am married to Mr.
Grygoriy Shailendra, a politician who owns a small gold company in
Cotonou; He died of Leprosy in the year February 2010, During his
lifetime he deposited the sum of =E2=82=AC 8.5 Million Euro Eight million,
Five hundred thousand Euros in a bank here in Cotonou Benin
republican, I am sending you this message with heavy tears in my eyes
and also praying that it will reach you in good health because I am
not in good health, I sleep every night without knowing if I may be
alive to see the next day. This has become difficult for me to move
around. I was married to my late husband for more than 15 years
without having a child and my doctor confided that I have less chance
to live, I decided to contact you to claim the fund since I don't have
any relation, as I grew up from an orphanage home.

I have decided to donate this money for the support of helping
Motherless babies, less privileged, Widows and churches also to build
the house of God because I am dying and diagnosed with esophageal
cancer for about 6 years now. I have decided to donate from what I
have inherited from my late husband to you for the good work of
Almighty God; I will be going in for a surgery soon.I need your urgent
answer to know if you will be able to execute this project, and I will
give you more information on how the fund will be transferred to your
bank account.

Thanks
Mrs. Rosario shailendra,
