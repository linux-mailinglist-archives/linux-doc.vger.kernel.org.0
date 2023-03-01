Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DFC6A7721
	for <lists+linux-doc@lfdr.de>; Wed,  1 Mar 2023 23:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjCAWyy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Mar 2023 17:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCAWyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 17:54:53 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062FE1B2F4
        for <linux-doc@vger.kernel.org>; Wed,  1 Mar 2023 14:54:53 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536bbef1c5eso393070987b3.9
        for <linux-doc@vger.kernel.org>; Wed, 01 Mar 2023 14:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etDsOsklTFhdv20/ihPgdxxbpxkX/HMYSlW+AO+gqjs=;
        b=aICLZyQueWqvaWvDfBNl3Qa+ej2826EfYBpQJ0krxNUkv7W0IojtiJyB9TpyYzYqD+
         4vVoio1fhG3MNeMoWrtVLlejQSqTVFvllyYOOaAjeq0PEAa9q9tX8ilCDWty0zS2HuAl
         nhrnBJ3qlgOGCl87X5uAYfBoq0OfhN7+D3gdpQ+v3JOl/SCVL/8VsuvMa3paPRBeHwBW
         04JbYb6OROdLwDXZWg1d00QAgGMl/TAPcQxqIsCfgTwQXBAYwwWTSmWMTuwmLxQI6tvG
         G5Deuhm0gt7WG5ZfhG3V/iOXTXn6wL+BvtGuMjCUmNsMyhnV/WxbSbLcrztjQVuPbrdf
         URdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etDsOsklTFhdv20/ihPgdxxbpxkX/HMYSlW+AO+gqjs=;
        b=ueizANAhABKQ9SDGsg1jc4AYeQnBznWlDshM3tx+Lj/hiy1m6KtL5DY1bw3hN686kf
         L1IImH5fmHxuuve5HHagWXszQKnchxrlRAciUrahBKXNLzCYzPx2i7G71dwUrXxjqKSm
         U5O0XdBE5GdhVglOGKS6bia7n2JuoPaiZ70Uc4Ao7iVodbhV505m/GB0VFAnrYDvU+ay
         sVVbrEPWtQc136aHnagbco6XZgZK+upN0Vzi0xAVzkoVtE18SZ8zz55X2kXBGL6HcyI5
         +frPsx4ByaytLKwiKrnG2GtgZenXj7myiwLboPBHJYDH8cqyNJwmvr022yiQQ9kkpKkE
         CDwQ==
X-Gm-Message-State: AO0yUKWjJn8ztBq9JgWgG2jl4ikhduBuyeO4Rd9xkPyKMAfn3TACV1HB
        RVop+LlNAyLuF41KrWCf/UPehyjnRh9hbY/HgAs=
X-Google-Smtp-Source: AK7set9Jt3R4B/nBZAnyRFxDNjwJfhVD2X3iBcKTlDbZdZQRQlWagMI6W28tE8f23Y+zuarxHqkoRSy6AKBRc2xeIVk=
X-Received: by 2002:a81:b305:0:b0:536:155a:b73d with SMTP id
 r5-20020a81b305000000b00536155ab73dmr5099693ywh.2.1677711292255; Wed, 01 Mar
 2023 14:54:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:44cd:b0:483:f82b:3d70 with HTTP; Wed, 1 Mar 2023
 14:54:51 -0800 (PST)
Reply-To: fiona.hill.2023@outlook.com
From:   Fiona Hill <lorijrobinson589@gmail.com>
Date:   Wed, 1 Mar 2023 14:54:51 -0800
Message-ID: <CAKXTXJzvLF6GO_SgDLWK5N=06Hz=hW8yw9BC_vzGwsnUoG+pGQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112a listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6374]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fiona.hill.2023[at]outlook.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lorijrobinson589[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lorijrobinson589[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Hello did you see my message i send to you?
