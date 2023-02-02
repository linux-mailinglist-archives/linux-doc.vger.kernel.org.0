Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A31A688493
	for <lists+linux-doc@lfdr.de>; Thu,  2 Feb 2023 17:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjBBQgi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Feb 2023 11:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjBBQgf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 11:36:35 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8EE30EAE
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 08:36:30 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id h17so2479330ljq.4
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em9KOz7Z4HbmSs3XsIqoezy5V4/6T6jB3yMfk8wPI8k=;
        b=S9ra05uvD328XXNDuOo83dhibYOONyf8Eg/0qA/aomo9ES6sUD44419EVHAVJnKJup
         v8CsxwGH7Mupr1Ne55sGyBoDp9daTEOMHJCmzXMWZC9nYSFsJElsYJKNiyX88152lndZ
         DmC7BlswRT9q0IYpKuiw9WaYFJz1P+2VQs/p+/474rj0u1v5tLPHYe5w+fsSWezadaUw
         FWL9rYzsz3/hNjftdb3mnvHF+LPLCla160bRSjylO5A4VDr9eaFDWXHftHqLWoDpo8GP
         zb88mBfcqEWksvdv8JWjSX9TAmikhcp2dxO8LJESUF3fA2Ase2oc7HG8tGhR0v3goGJ0
         LnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Em9KOz7Z4HbmSs3XsIqoezy5V4/6T6jB3yMfk8wPI8k=;
        b=sztvh9YvwChOf4jjrdYC8mYb1MW63ynnI0TnJsdY+Gvi3txvGDH9PlCt10JuWw1ArJ
         Qog0N24Z/s91KopPSxbIyv7e9SHZwle0zI8DJVKw3dnr/EmC+RJthLjug+DqHDoTHbNP
         QbT0bd97RHSCXTNFPF7JUFJBpsTRxe6z/Q0+xl01aJDDFmR5ieXGsPw9zMEDF+IBd1S5
         Hmh+Gj25JlYWeMeWl1qiFoJ+yB5RyCm9jJIa19u2T4abwN6DZ63affmf5xYrm4G69QDO
         +mg9V/r8lOL54N9461ytJWedIYvO6Q90aPwCGfHB8MMgoxkUqRMvqrUSuTITKJcwh6Zc
         OJOg==
X-Gm-Message-State: AO0yUKW5zT1qUcAbfqKQS4hBr6xcKnOVMCgSHSLLTLsjfwfdY84OikD7
        FkYCbClO8CBsMYk8HO/lo285s+Io/4Y6FkVAOVU=
X-Google-Smtp-Source: AK7set8uzIxSVMuDSHExBSxRpuqbSn9ZUIVsFIgan00jeDJrVKjfbPxw99S1L9ePqcMOm0vcMZJ3Smtfax0fJ2XXusc=
X-Received: by 2002:a2e:9885:0:b0:290:5a2e:c5d with SMTP id
 b5-20020a2e9885000000b002905a2e0c5dmr1011544ljj.155.1675355788682; Thu, 02
 Feb 2023 08:36:28 -0800 (PST)
MIME-Version: 1.0
Sender: adinduchukwudi7@gmail.com
Received: by 2002:a05:6022:31cf:b0:37:29fa:ba2f with HTTP; Thu, 2 Feb 2023
 08:36:27 -0800 (PST)
From:   Elena Tudorie <elenatudorie987@gmail.com>
Date:   Thu, 2 Feb 2023 22:06:27 +0530
X-Google-Sender-Auth: Pi90KMqu6juTBgDI706FtR_viwU
Message-ID: <CAP-A=S1WFT4=47eCmOz8OzNpm_onvtpY-id6UPv34PteS72m0Q@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Greetings.

I am Ms Elena Tudorie, I have a important  business  to discuss with you,
Thanks for your time and  Attention.
Regards.
Mrs.Elena Tudorie
