Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964C62B4B4
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2019 14:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfE0MPJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 May 2019 08:15:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42138 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfE0MOL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 May 2019 08:14:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so16712839wrb.9
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2019 05:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=PE2qyWliumUSN347T63t3e5/xkurT9iBkthy1WXizA0=;
        b=dhTS4Lyo6SbCjSE0fCEMltNu8hrg3FYreV6ihgKD/j5WlQmZ59l/hIEGDAS2WqhZmZ
         MD+K9RIb5EUi9NdZnsBB3RTdFvv4BgR1o/M2VaiYcGnxPZEcgJcTCF9IUrDkLGxtLojN
         uiryJJNMocYQifyuTO8UEQZjULzzqORfdm8GxBBLX7uhR4stQ1mR+LqM8oiICIgkfz5s
         cHXU/cRd1XfmnM3TKS1ytiOTb3u+HjbphRNTHLKIwz0oiJAdPz9ZIz0+D+G22dSc/JaX
         ZNcY9gexJzXKUMB5eD81sX/W4TlJUe0+ePBN5RUe05uuQ6F7tQd7qvgiphGssOwjBpjg
         oN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=PE2qyWliumUSN347T63t3e5/xkurT9iBkthy1WXizA0=;
        b=amXlHadY2SEvHu9bFhbex7kqch5f9YcQBj12cb3KKc4EPUqKXHC+ALXu6K6o0kiR4k
         yoqB8saON5dG4ZrnnLjTqlM4E/BEmf6YCh5CWypebe50npziVI6UXlGnAU/QOyMk0v9+
         DrboU+p2NYUoHa0IyyFatS0lFaIBTnNF1VKdl/SUZ6hiJRo3HtzBfOOz/FDHkR+2JZbs
         dJZlwrtdYHAwfahUlEeZblRmy0hlf3ZDDYju27l3+x2jw6y77A/iwgXBqt1wBnMzS7zB
         LFlCMW+aRb5N5z7OYRb7LbTocOW+dX4YKTtMk3/V02ZjuOV7Pj1/2U3kEBXvg/IdhMPq
         sdWQ==
X-Gm-Message-State: APjAAAXBlo0Qgj9vuvtYN3uoI9gmwJoug3IyQuwRd8/vsJbl47BkoXsi
        oVbTjuXdJD2g9ycL6OIeeSekNw==
X-Google-Smtp-Source: APXvYqxFIeIFAETZTduZaUtWDN1ZmmLNb6kXNXnGerFOHnX/KETZawLZ46jctX7F/liDIJ5DEWDDew==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr50236022wrn.34.1558959249250;
        Mon, 27 May 2019 05:14:09 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t7sm10699918wrq.76.2019.05.27.05.14.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 05:14:08 -0700 (PDT)
From:   Loys Ollivier <lollivier@baylibre.com>
To:     Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, Jonathan Corbet <corbet@lwn.net>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        ard.biesheuvel@linaro.org, catalin.marinas@arm.com,
        Anup Patel <Anup.Patel@wdc.com>, Zong Li <zong@andestech.com>,
        Atish Patra <atish.patra@wdc.com>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Palmer Dabbelt <palmer@sifive.com>,
        "paul.walmsley\@sifive.com" <paul.walmsley@sifive.com>,
        Karsten Merker <merker@debian.org>,
        linux-riscv@lists.infradead.org,
        "marek.vasut\@gmail.com" <marek.vasut@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [v4 PATCH] RISC-V: Add an Image header that boot loader can parse.
In-Reply-To: <20190524041814.7497-1-atish.patra@wdc.com>
References: <20190524041814.7497-1-atish.patra@wdc.com>
Date:   Mon, 27 May 2019 14:14:03 +0200
Message-ID: <86zhn8p01g.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu 23 May 2019 at 21:18, Atish Patra <atish.patra@wdc.com> wrote:

> Currently, the last stage boot loaders such as U-Boot can accept only
> uImage which is an unnecessary additional step in automating boot
> process.
>
> Add an image header that boot loader understands and boot Linux from
> flat Image directly.
>
> This header is based on ARM64 boot image header and provides an
> opportunity to combine both ARM64 & RISC-V image headers in future.
>
> Also make sure that PE/COFF header can co-exist in the same image so
> that EFI stub can be supported for RISC-V in future. EFI specification
> needs PE/COFF image header in the beginning of the kernel image in order
> to load it as an EFI application. In order to support EFI stub, code0
> should be replaced with "MZ" magic string and res4(at offset 0x3c)
> should point to the rest of the PE/COFF header (which will be added
> during EFI support).
>
> Tested on both QEMU and HiFive Unleashed using OpenSBI + U-Boot + Linux.

Thanks Atish, happy to have this support that makes the boot process
more straightforward.
Tested on HiFive Unleashed using OpenSBI + U-Boot v2019.07-rc2 + Linux.

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Karsten Merker <merker@debian.org>
> Tested-by: Karsten Merker <merker@debian.org> (QEMU+OpenSBI+U-Boot)
Tested-by: Loys Ollivier <lollivier@baylibre.com>
