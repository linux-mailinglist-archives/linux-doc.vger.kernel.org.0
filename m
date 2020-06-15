Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55A61F9CFF
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2020 18:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbgFOQS1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jun 2020 12:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730764AbgFOQS0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jun 2020 12:18:26 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2C6C061A0E
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2020 09:18:25 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id l6so15890748ilo.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2020 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XKH1pFFT8fVLLE8wJVLgNv5/MLMQFH17bRtZ3CycmS4=;
        b=Pw9OHAebA1N0FvHpjJwmZEwQvxIUVPKUU46IDt0hXJBY5QGYnIRmaZXNQdh14cvYtM
         PbUzXwyKGkLQwALMlBo2ejTbAD7NzCGmtOkNt3sH4MiHnvlEOvqRBIXtmgUpvkD7OING
         DmN12sARsa40E7oSbxgo/i1RwyEHEg7mBpFxIBVpMzmlU54s9uhEWhHsT81ToRuHpNBh
         XTBq//VsSUTt/SuKnbJ3ujsN3pEC1W26a+yRSdC7Y8wXDyuF2ct7UahPiQu14eALmWDs
         1RFce1GYqEfg8gUoaHO8OBoRCsqXlJgf/fHdYKNBhGMKuePsx/H/mLCOQRuJ3B3SZSUn
         slag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XKH1pFFT8fVLLE8wJVLgNv5/MLMQFH17bRtZ3CycmS4=;
        b=Bl8kSXqolHEm7toGKztJbsHaqpoQh1fMJfTDK0jGqYqPeGWwnTjo4zvVHj4oMyv/XN
         1dz7CDyfi52zrnvqygUjbuRFKjY0hpB6LCBu4850csaij+iruoAg7lAwS11bJaXK53bl
         r+gphAB6NmkCmx8ptu0HqHg0XPoLkDRJdaT2ttako1x0VcV6GZx4jJlillM2sVUOApqx
         ycAVA1t9dOSu4qiWbEu2RTvWnPPPFqc/dyvmJQcPnOh+xC1soCU+voMybyj8WjZKg4qX
         ZBI1wa+3y7+dsDftfdMw70bzmrYx7S3xwUVjkDka/dAuEwJs2xb62VTp+9LgeGhot0Hn
         HSQQ==
X-Gm-Message-State: AOAM531i0cb7uXp0hiKTh5PR2uHWkxAIC2P6hCPcx93dGXzfifbXrgFD
        MzGwsLnzQgDFlIlm0vYs+U2k1wnbDVMQttSg+bTfqw==
X-Google-Smtp-Source: ABdhPJyXMBGatSHTzrYK8/qvM6Z4jlzZSMib+6mon2WmMLWv63Czwyscsai5qRgsUgx0tSdIE+ac9RWUMq0HFut88qc=
X-Received: by 2002:a92:5856:: with SMTP id m83mr27403174ilb.72.1592237905055;
 Mon, 15 Jun 2020 09:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592203650.git.mchehab+huawei@kernel.org> <11bd0d75e65a874f7c276a0aeab0fe13f3376f5f.1592203650.git.mchehab+huawei@kernel.org>
In-Reply-To: <11bd0d75e65a874f7c276a0aeab0fe13f3376f5f.1592203650.git.mchehab+huawei@kernel.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 15 Jun 2020 10:18:14 -0600
Message-ID: <CANLsYkyGUL3uZEQJ9HuHgvuoGtq7kjELT_H=YGq6U_tUqz-kAQ@mail.gmail.com>
Subject: Re: [PATCH 20/22] docs: move remaining stuff under
 Documentation/*.txt to Documentation/staging
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On Mon, 15 Jun 2020 at 00:51, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There are several files that I was unable to find a proper place
> for them, and 3 ones that are still in plain old text format.
>
> Let's place those stuff behind the carpet, as we'd like to keep the
> root directory clean.
>
> We can later discuss and move those into better places.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/index.rst                       | 13 ++++++++
>  .../{crc32.txt => staging/crc32.rst}          |  0
>  Documentation/staging/index.rst               | 32 +++++++++++++++++++
>  .../{kprobes.txt => staging/kprobes.rst}      |  0
>  Documentation/{lzo.txt => staging/lzo.rst}    |  0
>  .../remoteproc.rst}                           |  2 +-
>  .../{rpmsg.txt => staging/rpmsg.rst}          |  0

For remoteproc.rst and rpmsg.rst, I suggest moving them under a new
"remoteproc" directory.

Thanks,
Mathieu

>  .../speculation.rst}                          |  8 +++--
>  .../static-keys.rst}                          |  0
>  Documentation/{tee.txt => staging/tee.rst}    |  1 +
>  Documentation/{xz.txt => staging/xz.rst}      |  0
>  Documentation/trace/kprobetrace.rst           |  2 +-
>  MAINTAINERS                                   |  8 ++---
>  include/linux/jump_label.h                    |  2 +-
>  lib/crc32.c                                   |  2 +-
>  lib/lzo/lzo1x_decompress_safe.c               |  2 +-
>  lib/xz/Kconfig                                |  2 +-
>  samples/kprobes/kprobe_example.c              |  2 +-
>  samples/kprobes/kretprobe_example.c           |  2 +-
>  19 files changed, 63 insertions(+), 15 deletions(-)
>  rename Documentation/{crc32.txt => staging/crc32.rst} (100%)
>  create mode 100644 Documentation/staging/index.rst
>  rename Documentation/{kprobes.txt => staging/kprobes.rst} (100%)
>  rename Documentation/{lzo.txt => staging/lzo.rst} (100%)
>  rename Documentation/{remoteproc.txt => staging/remoteproc.rst} (99%)
>  rename Documentation/{rpmsg.txt => staging/rpmsg.rst} (100%)
>  rename Documentation/{speculation.txt => staging/speculation.rst} (97%)
>  rename Documentation/{static-keys.txt => staging/static-keys.rst} (100%)
>  rename Documentation/{tee.txt => staging/tee.rst} (99%)
>  rename Documentation/{xz.txt => staging/xz.rst} (100%)
>
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 71eca3171574..3b491af0122d 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -182,6 +182,19 @@ subprojects.
>
>     filesystems/ext4/index
>
> +Other documentation
> +-------------------
> +
> +There are several unsorted documents that don't seem to fit on other parts
> +of the documentation body, or may require some adjustments and/or conversion
> +to ReStructured Text format, or are simply too old.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   staging/index
> +
> +
>  Translations
>  ------------
>
> diff --git a/Documentation/crc32.txt b/Documentation/staging/crc32.rst
> similarity index 100%
> rename from Documentation/crc32.txt
> rename to Documentation/staging/crc32.rst
> diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
> new file mode 100644
> index 000000000000..8e98517675ca
> --- /dev/null
> +++ b/Documentation/staging/index.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Unsorted Documentation
> +======================
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   crc32
> +   kprobes
> +   lzo
> +   remoteproc
> +   rpmsg
> +   speculation
> +   static-keys
> +   tee
> +   xz
> +
> +Atomic Types
> +============
> +
> +.. literalinclude:: ../atomic_t.txt
> +
> +Atomic bitops
> +=============
> +
> +.. literalinclude:: ../atomic_bitops.txt
> +
> +Memory Barriers
> +===============
> +
> +.. literalinclude:: ../memory-barriers.txt
> diff --git a/Documentation/kprobes.txt b/Documentation/staging/kprobes.rst
> similarity index 100%
> rename from Documentation/kprobes.txt
> rename to Documentation/staging/kprobes.rst
> diff --git a/Documentation/lzo.txt b/Documentation/staging/lzo.rst
> similarity index 100%
> rename from Documentation/lzo.txt
> rename to Documentation/staging/lzo.rst
> diff --git a/Documentation/remoteproc.txt b/Documentation/staging/remoteproc.rst
> similarity index 99%
> rename from Documentation/remoteproc.txt
> rename to Documentation/staging/remoteproc.rst
> index 2be1147256e0..9cccd3dd6a4b 100644
> --- a/Documentation/remoteproc.txt
> +++ b/Documentation/staging/remoteproc.rst
> @@ -22,7 +22,7 @@ for remote processors that supports this kind of communication. This way,
>  platform-specific remoteproc drivers only need to provide a few low-level
>  handlers, and then all rpmsg drivers will then just work
>  (for more information about the virtio-based rpmsg bus and its drivers,
> -please read Documentation/rpmsg.txt).
> +please read Documentation/staging/rpmsg.rst).
>  Registration of other types of virtio devices is now also possible. Firmwares
>  just need to publish what kind of virtio devices do they support, and then
>  remoteproc will add those devices. This makes it possible to reuse the
> diff --git a/Documentation/rpmsg.txt b/Documentation/staging/rpmsg.rst
> similarity index 100%
> rename from Documentation/rpmsg.txt
> rename to Documentation/staging/rpmsg.rst
> diff --git a/Documentation/speculation.txt b/Documentation/staging/speculation.rst
> similarity index 97%
> rename from Documentation/speculation.txt
> rename to Documentation/staging/speculation.rst
> index 50d7ea857cff..8045d99bcf12 100644
> --- a/Documentation/speculation.txt
> +++ b/Documentation/staging/speculation.rst
> @@ -1,9 +1,11 @@
> +===========
> +Speculation
> +===========
> +
>  This document explains potential effects of speculation, and how undesirable
>  effects can be mitigated portably using common APIs.
>
> -===========
> -Speculation
> -===========
> +------------------------------------------------------------------------------
>
>  To improve performance and minimize average latencies, many contemporary CPUs
>  employ speculative execution techniques such as branch prediction, performing
> diff --git a/Documentation/static-keys.txt b/Documentation/staging/static-keys.rst
> similarity index 100%
> rename from Documentation/static-keys.txt
> rename to Documentation/staging/static-keys.rst
> diff --git a/Documentation/tee.txt b/Documentation/staging/tee.rst
> similarity index 99%
> rename from Documentation/tee.txt
> rename to Documentation/staging/tee.rst
> index c8fad81c4563..324604a15d17 100644
> --- a/Documentation/tee.txt
> +++ b/Documentation/staging/tee.rst
> @@ -162,6 +162,7 @@ The AMD-TEE driver packages the command buffer payload for processing in TEE.
>  The command buffer format for the different TEE commands can be found in [7].
>
>  The TEE commands supported by AMD-TEE Trusted OS are:
> +
>  * TEE_CMD_ID_LOAD_TA          - loads a Trusted Application (TA) binary into
>                                  TEE environment.
>  * TEE_CMD_ID_UNLOAD_TA        - unloads TA binary from TEE environment.
> diff --git a/Documentation/xz.txt b/Documentation/staging/xz.rst
> similarity index 100%
> rename from Documentation/xz.txt
> rename to Documentation/staging/xz.rst
> diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
> index cc4c5fc313df..c1709165c553 100644
> --- a/Documentation/trace/kprobetrace.rst
> +++ b/Documentation/trace/kprobetrace.rst
> @@ -40,7 +40,7 @@ Synopsis of kprobe_events
>   MEMADDR       : Address where the probe is inserted.
>   MAXACTIVE     : Maximum number of instances of the specified function that
>                   can be probed simultaneously, or 0 for the default value
> -                 as defined in Documentation/kprobes.txt section 1.3.1.
> +                 as defined in Documentation/staging/kprobes.rst section 1.3.1.
>
>   FETCHARGS     : Arguments. Each probe can have up to 128 args.
>    %REG         : Fetch register REG
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 805309399939..4c9814ee2fdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9597,7 +9597,7 @@ M:        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
>  M:     "David S. Miller" <davem@davemloft.net>
>  M:     Masami Hiramatsu <mhiramat@kernel.org>
>  S:     Maintained
> -F:     Documentation/kprobes.txt
> +F:     Documentation/staging/kprobes.rst
>  F:     include/asm-generic/kprobes.h
>  F:     include/linux/kprobes.h
>  F:     kernel/kprobes.c
> @@ -14500,7 +14500,7 @@ S:      Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rproc-next
>  F:     Documentation/ABI/testing/sysfs-class-remoteproc
>  F:     Documentation/devicetree/bindings/remoteproc/
> -F:     Documentation/remoteproc.txt
> +F:     Documentation/staging/remoteproc.rst
>  F:     drivers/remoteproc/
>  F:     include/linux/remoteproc.h
>  F:     include/linux/remoteproc/
> @@ -14512,7 +14512,7 @@ L:      linux-remoteproc@vger.kernel.org
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rpmsg-next
>  F:     Documentation/ABI/testing/sysfs-bus-rpmsg
> -F:     Documentation/rpmsg.txt
> +F:     Documentation/staging/rpmsg.rst
>  F:     drivers/rpmsg/
>  F:     include/linux/rpmsg.h
>  F:     include/linux/rpmsg/
> @@ -16761,7 +16761,7 @@ TEE SUBSYSTEM
>  M:     Jens Wiklander <jens.wiklander@linaro.org>
>  L:     tee-dev@lists.linaro.org
>  S:     Maintained
> -F:     Documentation/tee.txt
> +F:     Documentation/staging/tee.rst
>  F:     drivers/tee/
>  F:     include/linux/tee_drv.h
>  F:     include/uapi/linux/tee.h
> diff --git a/include/linux/jump_label.h b/include/linux/jump_label.h
> index 3526c0aee954..32809624d422 100644
> --- a/include/linux/jump_label.h
> +++ b/include/linux/jump_label.h
> @@ -68,7 +68,7 @@
>   * Lacking toolchain and or architecture support, static keys fall back to a
>   * simple conditional branch.
>   *
> - * Additional babbling in: Documentation/static-keys.txt
> + * Additional babbling in: Documentation/staging/static-keys.rst
>   */
>
>  #ifndef __ASSEMBLY__
> diff --git a/lib/crc32.c b/lib/crc32.c
> index 4a20455d1f61..35a03d03f973 100644
> --- a/lib/crc32.c
> +++ b/lib/crc32.c
> @@ -24,7 +24,7 @@
>   * Version 2.  See the file COPYING for more details.
>   */
>
> -/* see: Documentation/crc32.txt for a description of algorithms */
> +/* see: Documentation/staging/crc32.rst for a description of algorithms */
>
>  #include <linux/crc32.h>
>  #include <linux/crc32poly.h>
> diff --git a/lib/lzo/lzo1x_decompress_safe.c b/lib/lzo/lzo1x_decompress_safe.c
> index 2717c7963acd..7892a40cf765 100644
> --- a/lib/lzo/lzo1x_decompress_safe.c
> +++ b/lib/lzo/lzo1x_decompress_safe.c
> @@ -32,7 +32,7 @@
>   * depending on the base count. Since the base count is taken from a u8
>   * and a few bits, it is safe to assume that it will always be lower than
>   * or equal to 2*255, thus we can always prevent any overflow by accepting
> - * two less 255 steps. See Documentation/lzo.txt for more information.
> + * two less 255 steps. See Documentation/staging/lzo.rst for more information.
>   */
>  #define MAX_255_COUNT      ((((size_t)~0) / 255) - 2)
>
> diff --git a/lib/xz/Kconfig b/lib/xz/Kconfig
> index 22528743d4ce..5cb50245a878 100644
> --- a/lib/xz/Kconfig
> +++ b/lib/xz/Kconfig
> @@ -5,7 +5,7 @@ config XZ_DEC
>         help
>           LZMA2 compression algorithm and BCJ filters are supported using
>           the .xz file format as the container. For integrity checking,
> -         CRC32 is supported. See Documentation/xz.txt for more information.
> +         CRC32 is supported. See Documentation/staging/xz.rst for more information.
>
>  if XZ_DEC
>
> diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
> index 501911d1b327..240f2435ce6f 100644
> --- a/samples/kprobes/kprobe_example.c
> +++ b/samples/kprobes/kprobe_example.c
> @@ -5,7 +5,7 @@
>   * stack trace and selected registers when _do_fork() is called.
>   *
>   * For more information on theory of operation of kprobes, see
> - * Documentation/kprobes.txt
> + * Documentation/staging/kprobes.rst
>   *
>   * You will see the trace data in /var/log/messages and on the console
>   * whenever _do_fork() is invoked to create a new process.
> diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> index 013e8e6ebae9..78a2da6fb3cd 100644
> --- a/samples/kprobes/kretprobe_example.c
> +++ b/samples/kprobes/kretprobe_example.c
> @@ -11,7 +11,7 @@
>   * If no func_name is specified, _do_fork is instrumented
>   *
>   * For more information on theory of operation of kretprobes, see
> - * Documentation/kprobes.txt
> + * Documentation/staging/kprobes.rst
>   *
>   * Build and insert the kernel module as done in the kprobe example.
>   * You will see the trace data in /var/log/messages and on the console
> --
> 2.26.2
>
