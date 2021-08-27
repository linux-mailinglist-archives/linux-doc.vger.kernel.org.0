Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C74D3F9A2F
	for <lists+linux-doc@lfdr.de>; Fri, 27 Aug 2021 15:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhH0NbC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Aug 2021 09:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbhH0NbC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Aug 2021 09:31:02 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39448C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 06:30:13 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id u18so1008307qvq.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9hYvHFGz/V7D23iiTPTOyxcZm7pKUcDRg4kDhPveMaM=;
        b=RWh3PyaLn9DmYFUvWMAb0sMx7t5tv8neu2ri9D8mJwjUh0f9X4mBOK1mWoSNx+Xk7Q
         UXygO2RUgsM9ytHw0J7ZnZXf2r3UP4CjRgIHdV2VX/t+bSo6kamNRr5JE5kNDltUDNzn
         WQgF2d+L0cB45zjDOFEV11+rf/T7+4zgjItd3QTdskgaWTbyVTVvxaCh837ERZ9KLWWx
         6TAPmCSOQ6wzP73NwO/nlGoXEsh1OPCVaa9p1VGWwEwyT1w8H6tsGbZ3QUOGbnXVXzFe
         STjKaFkm5jV0/3qBR3EBlTYcZnURiYHMgxlqQvSKJJpwNGztKUytgfSlnkTIo0X69uPm
         QMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9hYvHFGz/V7D23iiTPTOyxcZm7pKUcDRg4kDhPveMaM=;
        b=jn/y3qNthPiNzLSj5XDB+gsInw9VWMCL3OPpT4ItWkeTOAcm+wA0NJpjHDeKc8Ylcx
         McyXSe2nEBRTRFmX980PJWjEU3zYwDHjzGosMkOnxOlHn5/mOFIyKLqoeD/VFl9is3Kf
         kf34faU8B0MBzvk6siWpnKEdUuE0ucz6a7uz8uv5UbR4My0llbLpsCZNzHSo425FrgK3
         aiP5u5NsCCzpelakgJ2aM11hzdbeJTGTQvw7pamQZF93aFf2pE4yisAZVCEwdtmEr6lz
         LxIroWX5QvMgozA7qx5HkhsPQxZsnF+UczTPS6Qr/pxSu3CD0Ifldm8s+vhtGdhBxVT+
         pMuA==
X-Gm-Message-State: AOAM5330cX0S95umsKr+GktzFML0IC15d2M4YR/oha3EoRMI0w+bzdzU
        mdSl0dM2LeSTTpqM6Cx/6KOGqQ==
X-Google-Smtp-Source: ABdhPJy6C+imSV9BJygXNb/9syIQPPZVv3Rskg/63cA9hZ4wB9eYt23ZeyxBKJWpGeqjdoeuyRZmDA==
X-Received: by 2002:ad4:5aee:: with SMTP id c14mr7922342qvh.19.1630071012375;
        Fri, 27 Aug 2021 06:30:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id q184sm4865997qkd.35.2021.08.27.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:30:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mJbvv-005gvU-41; Fri, 27 Aug 2021 10:30:11 -0300
Date:   Fri, 27 Aug 2021 10:30:11 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Ross Philipson <ross.philipson@oracle.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
        linux-doc@vger.kernel.org, dpsmith@apertussolutions.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        luto@amacapital.net, kanth.ghatraju@oracle.com,
        trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v4 14/14] tpm: Allow locality 2 to be set when
 initializing the TPM for Secure Launch
Message-ID: <20210827133011.GJ1200268@ziepe.ca>
References: <1630070917-9896-1-git-send-email-ross.philipson@oracle.com>
 <1630070917-9896-15-git-send-email-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630070917-9896-15-git-send-email-ross.philipson@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 09:28:37AM -0400, Ross Philipson wrote:
> The Secure Launch MLE environment uses PCRs that are only accessible from
> the DRTM locality 2. By default the TPM drivers always initialize the
> locality to 0. When a Secure Launch is in progress, initialize the
> locality to 2.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>  drivers/char/tpm/tpm-chip.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Global state like this seems quite dangerous, shouldn't the locality
be selected based on the PCR being accessed, or passed down from
higher up in the call chain?

Jason
