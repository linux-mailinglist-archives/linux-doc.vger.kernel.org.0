Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A527410F6
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jun 2023 14:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjF1Me7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jun 2023 08:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjF1Me5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 08:34:57 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF82294E
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 05:34:55 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51dd0205b2cso1026781a12.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687955694; x=1690547694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deifRzGr11/JVry9UhGEOhSb6Ocp6b0NM1X8UOjbU6g=;
        b=0SJ73vJM/ObSup8qrZw5BiQ/vtxIX8ddoOJTfvpmdBRVnIIuUxUEMvlAc0iZt8EWe3
         5RExfOonAoqXAAdKiqtSQeAn9jm+8bPIVTEYeft/vhEFHesdfT3LiYFTxKZ83rDajWRz
         8XPBKBLigMtThmVgDUS1Pf8Miy6eX7CLBBejuWmJcukdZ9JpEW9RpLJJT8Sd7AaQJFqO
         3oATLZBZoRN+pxtyf/fZSwUnwIoR9usyJII0rI0vBPF/JIdfIS4M8NYnEiEyOvettsSw
         Ltl/VAlRjVo03an66bp3KzSgBgJHmtknjn+2lBu/G0Vp8wGvkgNgYEGoH+X25Av2lPNt
         h9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687955694; x=1690547694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deifRzGr11/JVry9UhGEOhSb6Ocp6b0NM1X8UOjbU6g=;
        b=Z8qOPuWA2KWiiDlyoZ2Ng9e7PuPX2SnXNRB73zgZh931n2n5GtLC1gQR0LpbYZ4DyK
         Lm7+NtTrdbSjJcDIj+dKaaWOHpDxHT7zWNMjwtgHKbXJpmLB4QFLJM2jvDII/KCnY65X
         01HaYj1TjbAI/c6JYdi2RjBXA91sJ+dYUO7s5lSArF5nFEYWQEmYhcFsXycNfE/mKVYU
         de5tiDbWL90rcFK5g8D8+2KyzwmPa/gN8pE5jIC0bPWsccz2ZO7UoVBL8G/Uzw/ruOH5
         bel0NJ+zULuLm0nNLsWHpslPZ1q0ruvAi7EXqkpZGM2gFuSkfpRG58SvPuPr1FuRjHN3
         Lbog==
X-Gm-Message-State: AC+VfDz3JfILmb5NFd29KrZWsb5gCRI6L0vfEnRxOmwhcWtVJ08rxPKe
        VPB2GbO3NL5xOSV2gJScDquKfiASm/k1+XkxTkFejQ==
X-Google-Smtp-Source: ACHHUZ4WYvVDjePa4v/PscHrjN0+BnvFHWM/4ZCCdmWjEWEQbavYzuJMTE4M+tyhs00Ak/Fi2k5viEOJArhSPia30X8=
X-Received: by 2002:a05:6402:26ce:b0:4fc:97d9:18ec with SMTP id
 x14-20020a05640226ce00b004fc97d918ecmr1710680edd.21.1687955693998; Wed, 28
 Jun 2023 05:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230627222152.177716-1-charlie@rivosinc.com> <20230627222152.177716-2-charlie@rivosinc.com>
 <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com> <ZJtzEn9Yut3nPuw8@ghost>
In-Reply-To: <ZJtzEn9Yut3nPuw8@ghost>
From:   Anup Patel <anup@brainfault.org>
Date:   Wed, 28 Jun 2023 18:04:41 +0530
Message-ID: <CAAhSdy2MVu986VUUVTaY6K+s75-MpDoQvsi_jOVZWrCZq8WE2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
To:     Charlie Jenkins <charlie@rivosinc.com>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>, bjorn@rivosinc.com,
        Evan Green <evan@rivosinc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 28, 2023 at 5:09=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Yes it is small to have a default of 38-bits of userspace. I would be
> interesting in the opinions of other people on whether it would be
> acceptable to have the default be sv48 and require applications that
> prefer fewer bits to specify so with the given mmap hinting.

I think sv48 is a reasonable default instead of sv39. We should fallback
to sv39 only if the underlying host does not support sv48.

Regards,
Anup
