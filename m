Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3797639580
	for <lists+linux-doc@lfdr.de>; Sat, 26 Nov 2022 11:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiKZKq0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 26 Nov 2022 05:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiKZKqN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Nov 2022 05:46:13 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B30D17E2F
        for <linux-doc@vger.kernel.org>; Sat, 26 Nov 2022 02:46:11 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3b56782b3f6so61806327b3.13
        for <linux-doc@vger.kernel.org>; Sat, 26 Nov 2022 02:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6uPZo6V94trCgdT45DV4UtMD9jZ9uTpj89T0LyAAZY=;
        b=gDk+biDPxbH5VlML66mFcJGfWzpB+co6UtQSQx1pYa/yFY3sXmJ0dicPOw9UNHkK0/
         gcv+K4mjJLjlsEH2GCIiCeePKz0dl6Q191agVZIAfyO/ZyemjH14Q4BuS7Ozgm9NWAWw
         K856zzLwTX2ohMfVjfCOhl2xHH26FJ18fgUGTbkSquJznJGV5QPWG93qvmv3m+sHsAGk
         pOrkBtJOA47KmOVuJEpHbOaF1NGghy2ACObyxGgVHnfFBW0KWWWlbyZYAR+7DECBEs9Q
         s1JFQRhqygaSleLFrkJziCi+s71nhBz9iO5cr5CnzkkvA8pC5s1O000CgkZ6ma1JZ6oL
         c41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6uPZo6V94trCgdT45DV4UtMD9jZ9uTpj89T0LyAAZY=;
        b=WwcYIKGMJKEcQRnfzVvzSritb/Qq+8qFgvzrT/eof0j7GNhUaiFMFI/Rpp2syJtbTy
         yBqrXxYEOp+9/6Pc9jsgd/BsOCRbWCutb955IDV9OW/YdcdvNhEv0Xt9f+B9iothocmV
         lfZ0J9dYRu7MjE1uSVlESfF86y9YDdov9uH1lgfJTLDlJ/z5RCS++J0SES0gssTn86rQ
         uMMYTKGTHTArA07W1BOKxTVtz/X/jnmCqXbFKf3OuZ+hDzVJ7AaqLMByMG1BI6Vvh5ht
         VQmuFy474Yr5dj9vWIilrsBUz+oNG+h37lXRo5SvXhc/ilsqqy3cpAjt85u7VdaS2RK7
         iKmQ==
X-Gm-Message-State: ANoB5pkZZXchsukaxziWE+hcM9M4NgIpbB8uR7q9zCFeYFjaAsPQxVJI
        3L6bUujhGyiay4kdk3QGOuC0zJWUOMpOuoBpE84=
X-Google-Smtp-Source: AA0mqf5kNhA5y+3J57gl7NltUG4UpnkqgYR7EYa1Lcq1/8QiuYRngiYbbBb6mkzXPQKVTZKAiflyyRJpiSzxNZXyB98=
X-Received: by 2002:a81:b40f:0:b0:3b7:d162:ad7 with SMTP id
 h15-20020a81b40f000000b003b7d1620ad7mr9306013ywi.396.1669459570739; Sat, 26
 Nov 2022 02:46:10 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7108:393:b0:251:38ab:3bbc with HTTP; Sat, 26 Nov 2022
 02:46:09 -0800 (PST)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly01@gmail.com>
Date:   Sat, 26 Nov 2022 10:46:09 +0000
Message-ID: <CALav4vSe=SwJ7921+Hs+_Eat+S+T_nUw+jg5PbdSfhW_HmWztA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Dear

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
