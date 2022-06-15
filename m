Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1848F54C8B6
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jun 2022 14:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243952AbiFOMi3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Jun 2022 08:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348831AbiFOMiV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 08:38:21 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3B53585B
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 05:38:20 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id be31so18693653lfb.10
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=3A17HQW51q97eyI1XZOmcQl0OKbZyuBWZEkCoIY2Gp8=;
        b=Yc2BVcH6hhow1rOO6XvB5wtdFZsahq9AAW2wpD4R2WSP1ez2pGqTfbSr3s5GQWMTFh
         Lbo4OgrCoc0ufXCCllVjDLUHL0DwTi/2H8O3yQpLwuPe/IYvlbiBBU2jR7LNYM1jYsju
         stY0V+bbbOhORgcFXoKYC2EF1FTj1kf3DpwJxK45+9VAYj78m4ed0HZOWZpgHJSW4ny3
         3CCIbO/Gh0ZLKQRnSMyF9ZlJDtwIQ2ZCI1CXQYK8LTdxSpCDRg2DMVjUrcAol0S+aZk2
         rbGaUcuXDI/SxdRBeR6M5TTTayuwnULmEM3jzuT0B9y8TH8a45J7HaVvW0O5MTcs8bpA
         XuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3A17HQW51q97eyI1XZOmcQl0OKbZyuBWZEkCoIY2Gp8=;
        b=rq1l8pW7YA7E3J813zeOAEvmI1PZS3ZqD3VP9lbAGLO9TjvnvzOuCZShrgld8FScFA
         tNz3eJ6rV0xNmJroFDqtH+xZ5VUTMn6J2qj69gz/MyUqiXUZck55C925r9ftMdT4i+4M
         O3ZfwmhDVN3M7NxjGOtcrpdmYHd3tnJasdbnawsZ3A6WQVOAjG7MbUwiFnYU4XMC9w4O
         BSslXnlyEqflfOlP/yEEY3ccLqjuPHd9Kh2BmLGgMCSdC8n7PeEX5ZwHRjk1S70KoFuc
         b6A6Jqltbcjv1bNhiKsi9icVEiLSdgkSI1PLe9SD6BGz/ckh3TAp97FprwjKEHlZ+RW0
         BRXw==
X-Gm-Message-State: AOAM530H3UIc/bXVeP/o4+f5SNFIRit83tRr4wGzZL+C6Q+HuI3IA11q
        bfcB5YrUm9tYpeytV8E4Rc8+nwwm76LJXSNhcZc=
X-Google-Smtp-Source: AGRyM1vPGJxA0OZsPMyihHfAAyy4nfFACZzkPQcbwHenIIG5Uh2dFNFwMF/p2HreU6vw4GSlN+A/2rvgE6Z+vO17tbo=
X-Received: by 2002:a05:6512:130c:b0:477:e2ea:396e with SMTP id
 x12-20020a056512130c00b00477e2ea396emr5823448lfu.489.1655296698711; Wed, 15
 Jun 2022 05:38:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:5107:0:0:0:0:0 with HTTP; Wed, 15 Jun 2022 05:38:18
 -0700 (PDT)
From:   Ulrica Mica <ulricamica59@gmail.com>
Date:   Wed, 15 Jun 2022 05:38:18 -0700
Message-ID: <CAD3PSc+zqbvbmQAWxNK4p1u2Ofy6wWUSWz5TFaHPWcXWWSWXdA@mail.gmail.com>
Subject: good morning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 

Hello dear
Can i talk to you please?
Ulrica
