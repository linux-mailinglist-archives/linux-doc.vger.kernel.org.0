Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E34730F638
	for <lists+linux-doc@lfdr.de>; Thu,  4 Feb 2021 16:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbhBDP0C (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Feb 2021 10:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237310AbhBDPZI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 10:25:08 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB750C061788
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 07:24:28 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id t142so1305937wmt.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=;
        b=CS+l9f4lcjQCD8lvkOFJ7F2ir8HDh268KpXOnkoYr9gE61e9FZYgQ0Cua27KtyefIr
         Cax9XopiM/Py5GmEzOBl6PzaL+BDr17+QouJZIUhJz4ZPljaiWRa32HyK8Psrhnq/jRO
         KXNpzCWUE6/sV0KVcfpAY64TWGdKEJ4dQVBvCIFiBYbj0XFJXxtxwHdFr0a/Pe7VyExD
         nKTqvvrmXI/BAS0Tbjq/v+iaSGc8BjsEfqzi6QjryJDeqsE7JTbMYxqnjpaJoVTRF4YB
         feD4fLtSYCsG1C4wiBZKdvmC529xYxeUZky9pfTV5tAQrEWBH1fLjHetH1uChLcH9hIY
         kxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=;
        b=VyRHRNnTSQHmVX7r+hqXogOaZctqBoM+tnx5jSi2q3tpWsDnkNHDUn+4ysGWm3JmLu
         m0OV3Y/qcDLCFDfx2YMpKBOZOuzK+WfLZngHyJdcTIB5v6ldrxYoLmKgkNziS+G5zuT1
         Y5OacXYwNrsuKQR1zc8+9M12C28Ze32TeS93oU7E46HjRIttf/glDuszyDzs6KEBuZ/5
         CfoVbk02BW0n8U1lLqWLZ2Yt+sH3ToeHrN1bc/wTjX9cIuziyRx4orEQIkvo6LxysYL0
         9myc4aCAHSBaVpwhVMxqQGQTLC1BXW+YyWrP6ob7i6b4qXrrMUeMsmyDk4JQqVp4EdxI
         j1Jw==
X-Gm-Message-State: AOAM5325LI9oV4MNATzDMSEvyEAaIESi0W5Y8947a+p0YAdZjIIQc8YX
        39ZbU1aklnb5/d17xCKLQeQzoA==
X-Google-Smtp-Source: ABdhPJzK+8hQQQd0W7CJq91rYRYdkogA/OEcRNJrNNUYDyrb4ShwlZGlpUWjPbji1ZjJoPZYHtjbFQ==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr30310wmd.9.1612452267459;
        Thu, 04 Feb 2021 07:24:27 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id k6sm8892749wro.27.2021.02.04.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:24:26 -0800 (PST)
Date:   Thu, 4 Feb 2021 15:24:24 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kgdb: rectify kernel-doc for kgdb_unregister_io_module()
Message-ID: <20210204152424.wrq3bgmq77fssjwj@maple.lan>
References: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 25, 2021 at 03:48:47PM +0100, Lukas Bulwahn wrote:
> The command 'find ./kernel/debug/ | xargs ./scripts/kernel-doc -none'
> reported a typo in the kernel-doc of kgdb_unregister_io_module().
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/debug/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied. Thanks.
