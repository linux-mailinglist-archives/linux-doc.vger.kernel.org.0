Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98EF6CA5CE
	for <lists+linux-doc@lfdr.de>; Mon, 27 Mar 2023 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjC0N2c (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Mar 2023 09:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjC0N2R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 09:28:17 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0BD6199
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 06:27:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w9so36270552edc.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679923637;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT1ntTJRA7Dyw6CsoaeXlaJ9ZTEdJhQliPCqlBPEyeY=;
        b=a1S8bccoMC6dQICPc0w92OaI13xGnF+A4hr9UqjI9y3MsbGEo2VtrlM4AyvcOlOx+r
         m93BNyceXauxvr/gAXZ6wAiKwGxIIon8gnGlBRpGhc17nyWTkCcJEufWZT7fJp6BEe7B
         +Zr5uKHuXMN3XUa4qEcwYL9SsxDh2wSKhXP6EEOJBB6/iJecwg8lNQfpaJ1assLA7SKz
         epWtBe2YVXsjtnu3uo0rEntEFGDndXRUOBpl8FQ6q7Fxf447G+Q86J4tBDmbp0tUYNx9
         rcF0Yh0IWujESls+Az76/H/7vJqmlNBMW2fQhYaAL56elUsDcn7e5kjtZpNMI3mnoTFy
         4ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923637;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UT1ntTJRA7Dyw6CsoaeXlaJ9ZTEdJhQliPCqlBPEyeY=;
        b=mI7GvFZXniM84xdl1yGkmIW+p86GbPd385tkppj5GmuMDXtjVd9dTy7h26d3rWcA1t
         jLCmsQfnLwHyggDg1svgjaYrWE1c0MPxjLvV0m8SxIRIoCnE2OvVF7eGwueoM+eR4v5L
         b8cS9dYz04q1GUsE4KrO3H/lqAFXTMMcIuJ5Wir+fmZYtHBOV5dC8RJhecUqULtWC3yX
         LHQcO3jXPl9wYTbcYEE/6iGZwWCxOMb4vjdOzZxDkq8FSENP7bYkSxhUK+1Mtb7LojGt
         mP0dogIuJqMrmigsrlnbKcakUxWa2ZB4uv/ulQG0FffY1ObNWIG6SkUpdfApGDLYkPsY
         /kgw==
X-Gm-Message-State: AAQBX9cSRveo+uZPuzj1SR1ECLoxJN8xoPuBLyziNLNsuV+S2xkhDOaG
        bPUfSH6FlVhHcY5lMkC7p3ljj7EwWOT2PRxfhZc=
X-Google-Smtp-Source: AKy350baNvStlVmD5goYzdG+Sl6fLjgtDvY5z7YClpHBjGHBlWQPobxEwgpBpHgBbiR8sxVErPS+hw8ObENB7Y4UwRQ=
X-Received: by 2002:a17:906:7846:b0:933:1967:a984 with SMTP id
 p6-20020a170906784600b009331967a984mr5532759ejm.15.1679923636807; Mon, 27 Mar
 2023 06:27:16 -0700 (PDT)
MIME-Version: 1.0
Sender: fdarpino19@gmail.com
Received: by 2002:a54:3788:0:b0:207:eb4:9c09 with HTTP; Mon, 27 Mar 2023
 06:27:16 -0700 (PDT)
From:   Jeffery Serge <jefferyserge00@gmail.com>
Date:   Mon, 27 Mar 2023 13:27:16 +0000
X-Google-Sender-Auth: SBMMNmKrdYBBwLZ6YFW_cGW8Vws
Message-ID: <CAErfpoQZ8iUtG8hjVWoLAnH=RDWMJstqVdB9tW3M5tfrbaBUDA@mail.gmail.com>
Subject: Re: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        LOTS_OF_MONEY,MONEY_FRAUD_5,NA_DOLLARS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_MONEY_PERCENT,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I am Mr. Jeffery Serge, the Bank Accountant manager. First I will like
to apologize for intruding  into your privacy, since we don't know
each other. Understand my reason  of contacting you. I wish to have
you as my best friend and also a business partner. I have a legal
business proposal worth $7.500,000 million U.S dollar with mutual
interest of 50/50.
