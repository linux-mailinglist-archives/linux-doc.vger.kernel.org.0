Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A935F32A3
	for <lists+linux-doc@lfdr.de>; Mon,  3 Oct 2022 17:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiJCPhF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Oct 2022 11:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiJCPgn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 11:36:43 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1EC2B1BD
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 08:36:35 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-131fd187e35so9665723fac.7
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date;
        bh=x07QwiF0YVdrVLJteyRlR6eYxGs0+1hLnQqkmgSmIGg=;
        b=bpzmvCWOgUXxyMbSujuAYMU5PB8r2p9CfhpYgg2fLxHfnMXJHeiDlx26UnUBYrlMoJ
         Se5CgCO1nHJxy7cXglZIn9exh6ONgqDHHAc7RuRH5EAVD4A6870nM0hFw8a5/sPPCx2w
         8Y87w7lWBtOf25i136pvvpBXDvMau5KNzoonXeFEvJsPbV/ku7mmSHHMuzfYkptf7WNo
         KoG98FolaS8zaKZxlAuBdfjmEViO2Kbw/TFx5dEYMYKHrOtUWj5LR9hWBZ5sFJgs9JxU
         egAyU2HpzVbydb9g/ckaxve+Lf3hQv2/5ey4mivEUBPfaNmXBi5XdhmBI/EO0Pj6nJBd
         Fn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=x07QwiF0YVdrVLJteyRlR6eYxGs0+1hLnQqkmgSmIGg=;
        b=vspuvSHy3UaXKbPi0iIAF9SLt9+4oSqMoeIWXHCjhGPoVpXUfTjltNO5ZUBSihtkEX
         Hi2RZtXRGKy/PWx5GogqQCUf34sOI/EVApFqqLmPLMdGrkWZA/0YFVNClXkCzVfWwbti
         ponGDvH1cOlQIoiZ3eIeW4pRkaHaXD1XXErMWB9eaueN85vDwslvCPQ8+WzE/lu97M/w
         kQlbwo+rxeCNv8r51J+3kPovRLS6eJpbEN9WGFkH/0qYEIJDSeszjDnM8d8YZfEQlAsy
         kQvrlLflf5NLlzomgzfAKHbSKHJYU4tfj5KJvJp0PAhJ6x3SLnSacBaBP0XJg26AVeyK
         Av5Q==
X-Gm-Message-State: ACrzQf2nWprvcDxAmFGU8X0rI5HvSHOHjzpHfjjmuagMOC15l8ILL5AW
        aKTm0GMKcD7JSeEtP8PqrRzuEzKnLZVMOlinfYA=
X-Google-Smtp-Source: AMsMyM56HdI249lKiuWXgCvI9E3bPwnyETxBivYQSJrvCZdF5HwChS74ertWueht4kEH7XtQw3PftNA/aHSJSxJt7Fs=
X-Received: by 2002:a05:6870:b01b:b0:127:d876:f27e with SMTP id
 y27-20020a056870b01b00b00127d876f27emr5760041oae.206.1664811395038; Mon, 03
 Oct 2022 08:36:35 -0700 (PDT)
MIME-Version: 1.0
Reply-To: edwardramos3030@gmail.com
Sender: edwardramos0002@gmail.com
Received: by 2002:a8a:1d0:0:b0:477:b29d:8146 with HTTP; Mon, 3 Oct 2022
 08:36:34 -0700 (PDT)
From:   "James Robertson (JRobertson)" <edwardramos1900@gmail.com>
Date:   Mon, 3 Oct 2022 15:36:34 +0000
X-Google-Sender-Auth: OFbIhV4hVlXf00AtvY7H2UsF1ME
Message-ID: <CA+7--fUJDRRrVKLYz8_W+FupH4t+SVEgf=amMYCnpZ+jg36Y-g@mail.gmail.com>
Subject: Hello again
To:     Edward Ramos <edwardramos0002@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Greetings, I am contacting you regarding the huge funds that resulted
from the liquidation of the account owned by a deceased account holder
who was your relation but died with COVID19. Contact me immediately to
tell you more. Sincerely Mr. James Robertson
