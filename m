Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCA7D6AAD
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2019 22:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbfJNUR7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Oct 2019 16:17:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33937 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729864AbfJNUR7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Oct 2019 16:17:59 -0400
Received: by mail-ed1-f65.google.com with SMTP id j8so4233091eds.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2019 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TmTTVnr6ZM5whoKrUx/7AN+GKz0T5h8z5E2EWOl+iVg=;
        b=O3lfujFHY1PPhG36UaRRX0oF/gqIf4OJ7/Z7pncf/y1kQw+1Yf4DaEkSOtilUuphko
         QiXu0p6CRky10fDxScNgTGhmP/VoFUCWu+K8BLIDBiBCSLSlni54d7sTdNA4u3bjITmb
         HXf4iHHY913FxNdPUjO6B+7sc3g/01oWt6nOLJqc5k1Qww+Aup9TDtnzlzhogbwCpfol
         Tq/jjI/mxoqvnGhJ77/qr6geWk7CBfvDvp4qs3HLvS0Xc80ZfoJfEBLnF24hWbcMncp5
         FuP6cTxRRJwDuYG0CWnmkPIm+XUJLGEWEOLxTpxfMH9CbtCt9Nt5AuYyefm9nQuJQKte
         5v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TmTTVnr6ZM5whoKrUx/7AN+GKz0T5h8z5E2EWOl+iVg=;
        b=shf1ADQUyu7eGMvK8+59tsMXVc+mey5hDocEUI2U4HDL4cgBlUTzrlb2wzmrASptaT
         VBPasG0VtgJndHwsNAdVRcq/L6EHc2VkPfPgtrYLQPMUgzWKqDwCmAW6w8xb31RRP1y+
         v4CrPX4oMINuyQ3Ke+nlelK3n79CbH+ecl7o1v29w3NFSxWHvkmmdzhqofXOAHUggyzQ
         o25Zx02IioP8TpkbY5DBY4xhhpQALQCSgjlmFIORlRLXywG8cjKi3glziOX9Q6Yz6mxm
         KCHkF0lpcmC8t+w/GkJxSFVaD27WDlZIgPsS8Cv5yCLNCqx4rxohZSRsOY+Q1AOd/2sS
         eCsA==
X-Gm-Message-State: APjAAAVenIDXS7usxeHzMdoNKwLVvwRyisNuv5MvMvW2KeQvJWqIaQHL
        ROV6ETpb4KGCmXGd3mrKjyrRayIN+njsQGOVt+pRaw==
X-Google-Smtp-Source: APXvYqxl9VbaNXdm1ZF2nw1U0O1w4RLqxmng5mXqFU2kIdhflAZ5y6fd8Qij4k7/mkA271HB67h7UEOiXMdnN9Ig5Ts=
X-Received: by 2002:a05:6402:68f:: with SMTP id f15mr29322899edy.170.1571084277286;
 Mon, 14 Oct 2019 13:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191011145721.59257-1-pasha.tatashin@soleen.com> <20191014200309.GM15552@linux.intel.com>
In-Reply-To: <20191014200309.GM15552@linux.intel.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 14 Oct 2019 16:17:46 -0400
Message-ID: <CA+CK2bCeO_2XkVLAbe5857F3wv-zJQdc9HLyedi3u2+xO9dDFA@mail.gmail.com>
Subject: Re: [PATCH] ftpm: add shutdown call back
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        peterhuewe@gmx.de, jgg@ziepe.ca,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-integrity@vger.kernel.org, linux-kernel@microsoft.com,
        thiruan@microsoft.com, bryankel@microsoft.com,
        tee-dev@lists.linaro.org, ilias.apalodimas@linaro.org,
        sumit.garg@linaro.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 14, 2019 at 4:03 PM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Fri, Oct 11, 2019 at 10:57:21AM -0400, Pavel Tatashin wrote:
> > From: thiruan <thiruan@microsoft.com>
> >
> > add shutdown call back to close existing session with fTPM TA
> > to support kexec scenario.
> >
> > Signed-off-by: Thirupathaiah Annapureddy <thiruan@microsoft.com>
> > Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
>
> Use the correct tag in the short summary (tpm/tpm_ftpm_tee).

Hi Jarkko,

Thanks, I will address your comments and send out a new patch soon.

Pasha
