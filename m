Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 763B96B4CA9
	for <lists+linux-doc@lfdr.de>; Fri, 10 Mar 2023 17:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjCJQUo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Mar 2023 11:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbjCJQUO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Mar 2023 11:20:14 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133B427483
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 08:16:02 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id z83so1858596ybb.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 08:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678464952;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Tr3U3wkl/fhbS0q0tGYhcEKwUcoYH2nJmcGkupTLtU=;
        b=e9oNj/qGe4jQBcIhGtgH1w18Wk9cO8+vnWjawYn4HUWkS8gzT2p1uCTxD2MNZ4pm8n
         08Pw/U8DQ2UjpLLo7WbbxK7iAu9NxySyzTUC2RSeb685jyYrsNnY1um3H9kyQ0Rlxqka
         zc6a59KmRc0HB04OJSUc93uNwfIDXfu0ISyPLZvKFBysb2mhdGbD9cmBP6G/gFI5ZioQ
         he5ATYQJgyJgbfc0FsoT45Uflb74sDNZ0K+I9gzRR2Q5QRzbMS7I0QeIGuSiJIXz72dS
         KE5jISyVTRx3joa0RgqIiPl0YxQ3Z2GDXXXLcGFN+Dp9wt1pdtt9NugPwFOFxmqEPxfg
         zhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464952;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tr3U3wkl/fhbS0q0tGYhcEKwUcoYH2nJmcGkupTLtU=;
        b=6BEFgk+26cG8USijrdBmNlqOQqqi8N9TaZAa1kDPfXlZlWKdCoB5BZ90BRgSFv1KXp
         qACi6lgk9nCq063uSRci4QPVvNHcKWeQhXQGFJhhk9GNDdPlo1JhQQgrp8pUv8vcZ2Rk
         iqAnq+0M/uBlF7XwOYaZGygmzYI6mAv+46BsY1tfoFXN7gUqxTkYIVL95vkN4QIBLdis
         nMTBdMTnVgGecBi2fH5xe++bGxkk88sMt/wRg8J6mnCx2V+9odfI757MahJoea69sK9H
         yDZtFIS1zyED3qp3eto4+c2/OxP+oMDFE7kkCrr3QKvdqWMpPMahyserjr/jZUq0tJOW
         JmPw==
X-Gm-Message-State: AO0yUKXK6zPJOgUvyKPxK5gtKMOv88febJLnshlAptWdELutXO9SazEX
        7if0px2i00EeaqrtqB+S8JanP8u4PZqwHvU9O+Y=
X-Google-Smtp-Source: AK7set8tz62D6RZ3scCBwl5AoaH84E6V/nmVTh+2eMuOrcMHIAWLsMOS5MZZlBQd1b7TtDxz7peTfx3cHSPR7GYGGmY=
X-Received: by 2002:a5b:384:0:b0:a65:8cd3:fc4 with SMTP id k4-20020a5b0384000000b00a658cd30fc4mr15828933ybp.5.1678464951994;
 Fri, 10 Mar 2023 08:15:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:360f:b0:1df:398:c28c with HTTP; Fri, 10 Mar 2023
 08:15:51 -0800 (PST)
Reply-To: adbahassan.mohammed@gmail.com
From:   Adba Hassan <enerst.nawnne22@gmail.com>
Date:   Fri, 10 Mar 2023 16:15:51 +0000
Message-ID: <CACFyLymRuGHXMXCySDDxYhJxOJzMY3POpAsAttffiwUFguP3Xg@mail.gmail.com>
Subject: from Mrs. Adba
To:     enerst.nawnne22@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

 Dear Friend,
Go through the documents carefully. Attached is all the related legal
documents from my late husband with the company where our family
inheritance has been deposited.
Regards,
Abda Hassan Mohammed
