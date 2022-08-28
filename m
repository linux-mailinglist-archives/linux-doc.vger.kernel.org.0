Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1785A3AB5
	for <lists+linux-doc@lfdr.de>; Sun, 28 Aug 2022 02:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiH1Ans (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 27 Aug 2022 20:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiH1Anr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Aug 2022 20:43:47 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776BA42ACF
        for <linux-doc@vger.kernel.org>; Sat, 27 Aug 2022 17:43:45 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id d126so5111415vsd.13
        for <linux-doc@vger.kernel.org>; Sat, 27 Aug 2022 17:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=Md7FbW5U64dg6udfzmFhUzL2Dtg560eAwFQaiaSqtTF7eeBzN4w9NFeVCOC+w5iS0b
         7GC542hL8yCncHDPusZ/S3SwMfMTtbZu6BqxBA/ioFRs++btSz1gF4O7RW2d6n9KhROA
         MNbHQaoZAr41YYnV5kVg8j5hXHsadWSYahhldMeJ7EEQ8AjHUfRvT7XwvqUZck6sQN1D
         OLtZMFJ3G2ZSIhI4H0LA6xsYnhAAPQsLOTGcm0m6+GAvbSVjBzEW5plqoIQiHSjuP0bV
         yoSN47LdUA22rDLglGvIMil8G0M14OZwfOISKFpXrly7hnng0xKYBsHWPalGIKFXjVFU
         b/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=wSoZ9NN1bfto+GfktGJ5GEQU4XvOnLZX15KEJ7UxrA1GhUe+uzlUi2TJA7V0URwbuz
         7tsuA556r+oxCthpgTj0JwV0apvEbIJhOhku4k70xofMHWreeCAqsTzgKkcSKsubZBZK
         idQcLpvH5DsYZXHAjIjrzcw+BDYxzlZXNAXikXqMwRDNYnvYyn2YGawWqv/Ddu2TtkKE
         i4q+kbFHdVF9Jiv3Is4zrjOl8evOiDW1gaZEYHwQaD8PW0M1Tc7BasvXhZKYZqaLZPQj
         bpjeg3tRyJoRryYw2H9gHWLJV/I3+dgJSEA5Dl7Y1Vpnih7pouP99RRppfm2W9qTRYt6
         Td3Q==
X-Gm-Message-State: ACgBeo0iQuJfb7qpjwCpjKcm4GJf2RAWGjfvO9H+t0mW+sw4Tx21mcsm
        70DguW2M4Cw2zoBFCl5lLvuJ0x1KZrOG94NYaXU=
X-Google-Smtp-Source: AA6agR7Mcc8fyQn/iwXu3s7cguMQCS7dh5/ITkszTj+ENUkZpe6XpTqo25XIytCU08F11qLN1aTs12zODdarimHDYj0=
X-Received: by 2002:a67:d105:0:b0:38d:c73d:fe21 with SMTP id
 u5-20020a67d105000000b0038dc73dfe21mr1785900vsi.36.1661647424576; Sat, 27 Aug
 2022 17:43:44 -0700 (PDT)
MIME-Version: 1.0
Sender: komidegbe902@gmail.com
Received: by 2002:a05:6130:28b:0:0:0:0 with HTTP; Sat, 27 Aug 2022 17:43:44
 -0700 (PDT)
From:   Miss Reacheal <reacheal4u@gmail.com>
Date:   Sun, 28 Aug 2022 00:43:44 +0000
X-Google-Sender-Auth: i6Su7Qw_4L5oBPgh3dG1ieUxgkI
Message-ID: <CAGcQMfiwwAiR-mKCTDNbo8_OULwazt92HPaB44VvNNyCkQ37Cg@mail.gmail.com>
Subject: RE: HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_99,BAYES_999,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Fr=C3=A4ulein Reachal
