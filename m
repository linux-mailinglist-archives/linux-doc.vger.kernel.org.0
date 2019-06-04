Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4035054
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2019 21:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFDThO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Jun 2019 15:37:14 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43143 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfFDThO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jun 2019 15:37:14 -0400
Received: by mail-pl1-f194.google.com with SMTP id cl9so3633562plb.10
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=wR7K6rwo4Jf2/AFMZkaXDQN87jKfQ96qQ877W6vcmgc=;
        b=ZWkTsPMzXzKaNC9jV4BMIaQAFzkFVB8W3nMso6N1+u6RRZU361q9SzN3hhaamFaj2S
         3FDqL7nnOPRiiOCMeWeg3uelWuIlruaQIHjSSZJBs1thMX54ug2zKZ57AfZyY4FGVBnC
         3GibHDBOiL4ZD2EFcTuR2+80tm+CoOayxGfD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=wR7K6rwo4Jf2/AFMZkaXDQN87jKfQ96qQ877W6vcmgc=;
        b=iLQOlng4DabaJ2IQu3RHRXxZcfaas3VSy9dXVA2xCf4UplWCU3ZfxqpTWB3YEeUn1s
         Jb/Rduh340FzYFKHzpQiI9jxnc7vnfASTTKPCXkaKHSesOXrFLOYE50B9TX3B1X8aePX
         U00XYC7fxnURt/jzftyiHptbN3UJBFz6lkhTcf5Rf0tBshkQM5rt6TbBOPqV4qu2OFSc
         YfHJ6pJWqFVTsXVPn3ognspn5u70Vv/bJi8T507RICf68JXJf45C6viDnHpIbMtMaLN7
         C5zVECfmraOj3tXav8D96K++4lpX0wyi7ELyqATMWARtdrPTy6axXgdqMWFLxA/+Q331
         3Q6w==
X-Gm-Message-State: APjAAAWNtD7xAdcI0ehCQfZUOZ8ovhTSJWGrCUMzCG8ZhYuVyuux8M1c
        bPc3dP4jdm/uLYAPeUiI/U3ILQ==
X-Google-Smtp-Source: APXvYqx/XG7jtVZN3IlWga1sbgAvrTvaf61q+rbJEyovi1zKQb0wfhhWaC0ana2hJwlp7SyRImh+FQ==
X-Received: by 2002:a17:902:d715:: with SMTP id w21mr38874215ply.234.1559677033534;
        Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 128sm20136240pff.16.2019.06.04.12.37.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
Message-ID: <5cf6c869.1c69fb81.5ed2e.84d1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190604182719.15944-1-helen.koike@collabora.com>
References: <20190604182719.15944-1-helen.koike@collabora.com>
Cc:     wad@chromium.org, keescook@chromium.org, snitzer@redhat.com,
        linux-doc@vger.kernel.org, richard.weinberger@gmail.com,
        linux-kernel@vger.kernel.org, linux-lvm@redhat.com,
        enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com,
        Helen Koike <helen.koike@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>
To:     Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] Documentation/dm-init: fix multi device example
User-Agent: alot/0.8.1
Date:   Tue, 04 Jun 2019 12:37:12 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Helen Koike (2019-06-04 11:27:19)
> The example in the docs regarding multiple device-mappers is invalid (it
> has a wrong number of arguments), it's a left over from previous
> versions of the patch.
> Replace the example with an valid and tested one.
>=20
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>=20
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

