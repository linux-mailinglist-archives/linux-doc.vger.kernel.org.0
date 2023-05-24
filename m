Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1EE470FC69
	for <lists+linux-doc@lfdr.de>; Wed, 24 May 2023 19:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjEXROU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 May 2023 13:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236438AbjEXRNq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 May 2023 13:13:46 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3702B10D1
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 10:12:59 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-5619032c026so17423447b3.1
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948334; x=1687540334;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=U0RweDPtnNdLBZk6SFJ4sZnDZUMwce5XUB5eCSZaFKBy0fwrdgkwOF61XJ2EIuqLBv
         tn7em+A68kyrifFMzePR/qga96snaSunsvELcDvNcVxElO6gWkdlVy8b5h4moMdmAfxe
         +0xuS/Bn/xWFiuH9T31ytY1AZNAejU01vLa1/w8dmddNvN8kQqdKcfOmxIkUxE2AvxGq
         EyRt8ycZlyHAtTF6RYy0jssSXiNgm2n1P7oS2l+dqw/zTSdzVo2RXVqjs1kfx4KgtQuV
         cLpWfE3nzCo4cy6bIapC9GVF6qmMTleayfsYkRQjM5vqo4O4kY396RNpBha1+zBptZ+U
         7mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948334; x=1687540334;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=EHevhyKxbxyO4FFpJEaeT0mzmZAuwQxgXpnRfUCoA2J8Yjmi6nyMY674rArSyqDk+f
         cbiZG3L06dS6biwqghHpW61U9Gnf0OSMS1NLwH/iyywKNqqzYIy0QX3jHEzbRfFcbPOq
         sOnnWiTw39A0aoZihe/mENlhpURTSKxsXwe69w8UQQgLSvpapyUxGsXnuREAxNwT2/3Q
         eiR7a084y4NFRFCkXoHyPuJ5FWKQ/Ky/hpXFCpaQx1inqZL6mOPI6eQOAjahSc9KA/Ka
         BdR7dMw63UKjU3ImBLeCFeWDoM82ca5BhtUOuJIU7BGLwUBpMJGCvNYFMrgEnjmAfpXC
         /lxQ==
X-Gm-Message-State: AC+VfDya6nx05OGfEkfgEoQXCcU9vhRRa8jFdAi0DGRzC4HtAZsBKFSx
        Vd1UAPnloZXsGsun+4/w1hvv21leTss7fQx8etg=
X-Google-Smtp-Source: ACHHUZ7kLr40ZzVq+a+FMMleVCf49qdtkBCLzoXw/oKCqygmdZjfeLaXpAFuykQogMe8NjOdo/zXdyXYIbW90AamQdU=
X-Received: by 2002:a0d:e68d:0:b0:54f:895e:70f7 with SMTP id
 p135-20020a0de68d000000b0054f895e70f7mr18570464ywe.9.1684948333898; Wed, 24
 May 2023 10:12:13 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsanahbruun1@gmail.com
Received: by 2002:a05:7010:5306:b0:32e:79f:6a2d with HTTP; Wed, 24 May 2023
 10:12:13 -0700 (PDT)
From:   Lisa William <lw466665555@gmail.com>
Date:   Wed, 24 May 2023 10:12:13 -0700
X-Google-Sender-Auth: OKfk9Q1HcaPJYMGXPGD_Tvp3wdM
Message-ID: <CAELFs-nkYj+BDbMd7KwbFCsmByjyZi6EAHGNmWbW+j80TX9j6A@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
