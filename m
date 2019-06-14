Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA7145713
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2019 10:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfFNIPa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jun 2019 04:15:30 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:46497 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfFNIPW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jun 2019 04:15:22 -0400
Received: by mail-lj1-f174.google.com with SMTP id v24so1416241ljg.13
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2019 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nbt8Hr9yG7v438JERq8EB5gL57vqsYI/Ggm6Adlr5do=;
        b=wuDWIRG930ZHMRMENaU+TYPSQ99Y8EAMOFMKEQzW07Elc9V89/arlgiuplmhHayjxO
         5pFmFL314SpjMiSH/Q5L84SBnMsmK8P/SBSv98fLSomg/vElzTb5RxJ/Go3R+F5nQ0Wh
         Sp9KqULnrGipKbplbmptnG+48AAVD6vuxoCowBRqKtM+4kWVrRXEFLgTCMycU3ewSROT
         X7yP+I7DlxVoXdNbojSsNhYNGuvsI/eWpf5Fm114O86MiUqjyhgVM+NtX+TkUUmIlB0n
         79V+vevZ/dWOa8YbwFZnPwG4tntBG3/zHaHRUK72EtzggDJs7/nHpj/GmfE/fuS5uIfD
         9GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nbt8Hr9yG7v438JERq8EB5gL57vqsYI/Ggm6Adlr5do=;
        b=B6eViL0dyXG4UoML9BwNgr4/3Vf945ygrI2iVIwfVS36JMTLaQywNIAD+aOb4GfjyD
         GGRb91q2KpiUbYdoU3zwK/5HxSFk2NRhrjOjbZIzqxX/UMWMeE3oowy4d7Gc6gXU6hxn
         0NpuLVIJgjO1DhmXAErGwy2xg1wlPyWckcwDAs9SgbkD34AcZqpY/sSunpyjM4iP2FNc
         z33eJzWNAuyfTlNK9M6ElFrJq04XKFg6PY+7Wz33akR/uQI1HEFkMsFc0GT8jOvq8FQj
         Uf/ZyHHs4wnYI6E44mEfRpVjDf8rD7TnJaYMOJHES2x3CoPiyT/rI7Xz+A12OOEjiV8Q
         dhbw==
X-Gm-Message-State: APjAAAULniMV5Evj6uNJYuq/Vm0WEQSsnD2GMRhcD/CFYbRCPnXVmJq0
        sXndlwUcxiYH0/oJGsWz+MviGw==
X-Google-Smtp-Source: APXvYqxAxhe2DP0BuTiG1IaqQX29loAzbMxhotvF+IiNpQPv/BBlMUDVSMR22yknwN6Rmzi/QXipSg==
X-Received: by 2002:a2e:124c:: with SMTP id t73mr17487617lje.190.1560500119854;
        Fri, 14 Jun 2019 01:15:19 -0700 (PDT)
Received: from jax.lan (81-236-179-152-no272.tbcn.telia.com. [81.236.179.152])
        by smtp.gmail.com with ESMTPSA id b18sm357673lfi.30.2019.06.14.01.15.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 01:15:19 -0700 (PDT)
Date:   Fri, 14 Jun 2019 10:15:17 +0200
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com,
        jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com, ard.biesheuvel@linaro.org,
        daniel.thompson@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tee-dev@lists.linaro.org
Subject: Re: [RFC 1/7] tee: optee: allow kernel pages to register as shm
Message-ID: <20190614081515.GA9347@jax.lan>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560421833-27414-2-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 13, 2019 at 04:00:27PM +0530, Sumit Garg wrote:
> Kernel pages are marked as normal type memory only so allow kernel pages
> to be registered as shared memory with OP-TEE.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks,
Jens
