Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0F123AC51
	for <lists+linux-doc@lfdr.de>; Mon,  3 Aug 2020 20:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgHCS1A (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Aug 2020 14:27:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:42284 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgHCS07 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Aug 2020 14:26:59 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C384A2D3;
        Mon,  3 Aug 2020 18:26:58 +0000 (UTC)
Date:   Mon, 3 Aug 2020 12:26:57 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 5.9
Message-ID: <20200803122657.635aee87@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit
b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-5.9

for you to fetch changes up to 2c12c8103d8f15790cf880f1545dafa36acb004a:

  scripts/kernel-doc: optionally treat warnings as errors (2020-07-31 11:11:17 -0600)

----------------------------------------------------------------
It's been a busy cycle for documentation - hopefully the busiest for a
while to come.  Changes include:

 - Some new Chinese translations

 - Progress on the battle against double words words and non-HTTPS URLs

 - Some block-mq documentation

 - More RST conversions from Mauro.  At this point, that task is
   essentially complete, so we shouldn't see this kind of churn again for a
   while.  Unless we decide to switch to asciidoc or something...:)

 - Lots of typo fixes, warning fixes, and more.

Once again there's some obnoxious merge conflicts with other trees (arm64,
f2fs, crypto, mm) which shouldn't be too painful to figure out.  I'm really
hoping that, with the RST conversion done, future pulls will have fewer of
these as well.
----------------------------------------------------------------
Alex Shi (3):
      doc/zh_CN: add admin-guide index
      doc/zh_CN: add clearing-warn-once Chinese version
      doc/zh_CN: add Chinese translation prefer section

Alexander A. Klimov (24):
      Replace HTTP links with HTTPS ones: Documentation/translations/zh_CN
      Replace HTTP links with HTTPS ones: Documentation/sphinx/parse-headers.pl
      Replace HTTP links with HTTPS ones: Documentation/driver-api
      Replace HTTP links with HTTPS ones: Documentation/filesystems
      Replace HTTP links with HTTPS ones: Documentation/process
      Replace HTTP links with HTTPS ones: Documentation/admin-guide
      Replace HTTP links with HTTPS ones: DRBD driver
      Replace HTTP links with HTTPS ones: CIFS
      Replace HTTP links with HTTPS ones: LVM
      kobject: documentation: Replace HTTP links with HTTPS ones
      docs: driver-api: i3c: Replace HTTP links with HTTPS ones
      docs: filesystems: Replace HTTP links with HTTPS ones
      docs: kvm: Replace HTTP links with HTTPS ones
      docs: locking: Replace HTTP links with HTTPS ones
      Replace HTTP links with HTTPS ones: OMFS
      Replace HTTP links with HTTPS ones: AFS FILESYSTEM
      docs: hid: Convert link to https
      Replace HTTP links with HTTPS ones: 9P FILE SYSTEM
      docs: gcov: replace links with HTTPS
      docs: ipmi: Replace HTTP links with HTTPS ones
      S390: Replace HTTP links with HTTPS ones
      docs: openrisc: Replace HTTP links with HTTPS ones
      arm64: Replace HTTP links with HTTPS ones
      CREDITS: Replace HTTP links with HTTPS ones

Alexander Lobakin (2):
      mailmap: add entries for Alexander Lobakin
      mailmap: add entry for <alobakin@marvell.com>

André Almeida (2):
      docs: block: Create blk-mq documentation
      futex: MAINTAINERS: Re-add selftests directory

Bhaskar Chowdhury (1):
      docs/mm: concepts.rst: remove unnecessary word

Chen Zhou (1):
      docs/zh_CN: update sysfs.txt about show() usage

Daniel W. S. Almeida (9):
      docs: index.rst: Add watch_queue
      docs: trace/index.rst: add histogram-design.rst
      docs: bpf/index.rst: Add ringbuf.rst
      docs: admin-guide/index.rst: Add pstore-blk.rst
      docs: admin-guide/mm/index: Fix reference to nonexistent document
      docs: staging/tee.rst: convert into definition list
      docs: process/index.rst: Fix reference to nonexistent document
      docs: bpf/bpf_devel_QA.rst: fix reference to nonexistent document
      docs: core-api/printk-formats.rst: use literal block syntax

Eric Sandeen (1):
      doc: cgroup: add f2fs and xfs to supported list for writeback

Federico Vaga (1):
      doc:it_IT: add symbol-namespace translation

Gustavo A. R. Silva (1):
      docs: deprecated.rst: Add zero-length and one-element arrays

Heinrich Schuchardt (2):
      doc: add novamap to efi kernel command line parameters
      doc: x86/speculation: length of underlines

Jiri Slaby (2):
      MAINTAINERS: use my kernel.org address
      Documentation: fb, fix path to modedb.c

Jonathan Corbet (5):
      docs: Don't push Sphinx upgrades quite so readily
      docs: f2fs: fix a broken table
      Merge branch 'docs-fixes' into docs-next
      Merge branch 'mauro' into docs-next
      docs: CIFS: remove a spam-site URL

Julia Lawall (5):
      docs: timers: drop documentation about LB_BIAS
      docs: filesystems: vfs: correct sync_mode flag names
      docs: filesystems: vfs: correct flag name
      PCI: correct flag name
      docs: ia64: correct typo

Kees Cook (3):
      Documentation: Clarify f_cred vs current_cred() use
      Documentation/security-bugs: Explain why plain text is preferred
      doc: yama: Swap HTTP for HTTPS and replace dead link

Konstantin Khlebnikov (1):
      mailmap: add entry for obsolete email address

Lee Jones (1):
      doc:it_IT: process: coding-style.rst: Correct __maybe_unused compiler label

Luc Van Oostenryck (2):
      doc: update URL for sparse's tarballs
      doc: add link to sparse's home page/internal docs

Lukas Bulwahn (1):
      MAINTAINERS: adjust kprobes.rst entry to new location

Manbing (1):
      trace doc: correct names of varous tracing documents

Mauro Carvalho Chehab (40):
      docs: fs: proc.rst: fix a warning due to a merge conflict
      docs: thermal: convert cpu-idle-cooling.rst to ReST
      docs: crypto: convert asymmetric-keys.txt to ReST
      docs: crypto: convert api-intro.txt to ReST format
      docs: crypto: convert async-tx-api.txt to ReST format
      docs: crypto: descore-readme.txt: convert to ReST format
      docs: misc-devices/spear-pcie-gadget.txt: convert to ReST
      docs: misc-devices/pci-endpoint-test.txt: convert to ReST
      docs: misc-devices/pci-endpoint-test.txt: convert to ReST
      docs: misc-devices/c2port.txt: convert to ReST format
      docs: misc-devices/bh1770glc.txt: convert to ReST
      docs: misc-devices/apds990x.txt: convert to ReST format
      docs: pci: endpoint/function/binding/pci-test.txt convert to ReST
      docs: arm64: convert perf.txt to ReST format
      docs: powerpc: convert vcpudispatch_stats.txt to ReST
      docs: sh: convert new-machine.txt to ReST
      docs: sh: convert register-banks.txt to ReST
      docs: move remaining stuff under Documentation/*.txt to Documentation/staging
      docs: staging: don't use literalinclude
      net: dev: add a missing kernel-doc annotation
      net: netdevice.h: add a description for napi_defer_hard_irqs
      scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
      net: pylink.h: add kernel-doc descriptions for new fields at phylink_config
      scripts/kernel-doc: handle function pointer prototypes
      fs: fs.h: fix a kernel-doc parameter description
      kcsan: fix a kernel-doc warning
      selftests/vm/keys: fix a broken reference at protection_keys.c
      docs: hugetlbpage.rst: fix some warnings
      docs: powerpc: fix some issues at vas-api.rst
      docs: driver-model: remove a duplicated markup at driver.rst
      docs: ABI: fix a typo when pointing to w1-generic.rst
      docs: fix references for DMA*.txt files
      docs: fs: proc.rst: convert a new chapter to ReST
      docs: dt: convert booting-without-of.txt to ReST format
      docs: trace: ring-buffer-design.txt: convert to ReST format
      docs: move nommu-mmap.txt to admin-guide and rename to ReST
      docs: move mailbox.txt to driver-api and rename it
      docs: move other kAPI documents to core-api
      docs: Add remaining Documentation/*.txt at staging/index.rst
      docs: staging: use small font for literal includes

Mike Rapoport (1):
      docs/core-api: memory-allocation: describe reclaim behaviour

Naveen N. Rao (3):
      docs: staging/kprobes.rst: Update some of the references
      docs: staging/kprobes.rst: Move references to a separate appendix
      docs: Move kprobes.rst from staging/ to trace/

Pavel Machek (1):
      devices.txt: document rfkill allocation

Pierre-Louis Bossart (1):
      scripts/kernel-doc: optionally treat warnings as errors

Puranjay Mohan (2):
      Security: Documentation: Replace deprecated :c:func: Usage
      Driver-API: Documentation: Replace deprecated :c:func: Usage

Randy Dunlap (66):
      Documentation: remove SH-5 index entries
      Documentation: fix filesystems/locking.rst malformed table warnings
      Documentation: fix sysctl/kernel.rst heading format warnings
      Documentation/admin-guide: cgroup-v2: drop doubled word
      Documentation/admin-guide: cgroup-v1/rdma: drop doubled word
      Documentation/admin-guide: dm-integrity: drop doubled words
      Documentation/admin-guide: media/building: drop doubled words
      Documentation/admin-guide: mm/ksm: drop doubled word
      Documentation/admin-guide: pnfs-block-server: drop doubled word
      Documentation/admin-guide: pnfs-scsi-server: drop doubled word
      Documentation/admin-guide: arm-ccn: drop doubled word
      Documentation/admin-guide: intel_pstate: drop doubled word
      Documentation/admin-guide: intel-speed-select: drop doubled words
      Documentation/admin-guide: sysctl/kernel: drop doubled word
      Documentation/admin-guide: tainted-kernels: drop doubled word
      Documentation/admin-guide: xfs: drop doubled word
      Documentation: Coccinelle: fix various typos etc.
      Documentation: arm64/arm-acpi: drop duplicate words
      Documentation: arm64/acpi_object_usage: drop duplicate words
      Documentation: arm64/sve: drop duplicate words
      Documentation: PCI: pci-endpoint-cfs: drop doubled words
      Documentation: PCI: pci-endpoint: drop doubled words
      Documentation: PCI: pci-error-recovery: drop doubled words
      Documentation: PCI: pci.rst: drop doubled words
      Documentation: trace/ftrace: drop doubled words
      Documentation: trace/histogram-design: drop doubled words
      Documentation: trace/stm: drop doubled words
      Documentation: virt: kvm/api: drop doubled words
      Documentation: virt: kvm/s390-pv: drop doubled words
      Documentation: filesystems: autofs-mount-control: drop doubled words
      Documentation: filesystems: caching/operations: drop doubled word
      Documentation: filesystems: configfs: drop doubled word
      Documentation: filesystems: directory-locking: drop doubled word
      Documentation: filesystems: fsverity: drop doubled word
      Documentation: filesystems: mount_api: drop doubled word
      Documentation: filesystems: overlayfs: drop doubled word
      Documentation: filesystems: path-lookup: drop doubled word
      Documentation: filesystems: sysfs-tagging: drop doubled word
      Documentation: filesystems: vfs: drop doubled words
      Documentation: numaperf: eliminate duplicated word
      Documentation: block: eliminate duplicated word
      Documentation: printk-basics: eliminate duplicated word
      Documentation: kgdb: eliminate duplicated word
      Documentation: fpga: eliminate duplicated word
      Documentation: gpu/komeda-kms: eliminate duplicated word
      Documentation: gpu/drm-uapi: eliminate duplicated word
      Documentation: hid/intel-ish-hid: eliminate duplicated word
      Documentation: i2c: eliminate duplicated word
      Documentation: kbuild/kconfig-language: eliminate duplicated word
      Documentation: leds/ledtrig-transient: eliminate duplicated word
      Documentation: maintainer-entry-profile: eliminate duplicated word
      Documentation: mips/ingenic-tcu: eliminate duplicated word
      Documentation: misc/xilinx_sdfec: eliminate duplicated word
      Documentation: powerpc/vas-api: eliminate duplicated word
      Documentation: s390/vfio-ap: eliminate duplicated word
      Documentation: security/keys: eliminate duplicated word
      Documentation: virt/kvm/api: eliminate duplicated word
      Documentation: vm/memory-model: eliminate duplicated word
      Documentation: x86: machinecheck: drop doubled words
      Documentation: x86: earlyprintk: drop doubled words
      Documentation: locking: mutex-design: fix duplicated word
      Documentation: locking: ww-mutex-design: drop duplicated word
      Documentation: coda: annotate duplicated words
      Documentation/driver-api: ntb: drop doubled word
      Documentation/driver-api: nvdimm: drop doubled word
      Documentation/filesystems/proc.rst: copy-editing cleanup

Shuli Zhang (1):
      Documentation/features: Add KGDB support on RISC-V

Souptick Joarder (1):
      docs: mm/gup: Minor documentation update

Stephen Kitt (1):
      docs: sysctl/kernel: document random

Sumit Garg (1):
      Documentation: tee: Document TEE kernel interface

Tao Zhou (1):
      doc/zh_CN: add cpu-load Chinese version

Tobias Klauser (3):
      Documentation/features: Add kmemleak
      Documentation/features: Add kcov
      Documentation/features: Remove unicore32 from kcov and kmemleak

Tom Rix (1):
      docs: process: Add an example for creating a fixes tag

Vegard Nossum (3):
      docs: path-lookup: fix HTML entity mojibake
      docs: path-lookup: more markup fixes
      docs: path-lookup: markup fixes for emphasis

Wang Long (1):
      Documentation: driver-api: update kernel connector

Yaohui Wang (1):
      Documentation: fix typo for core-api/cpu_hotplug documentation

Yue Hu (1):
      Documentation/admin-guide: tainted-kernels: fix spelling mistake

 .mailmap                                           |   9 +
 CREDITS                                            |  72 +-
 Documentation/ABI/testing/sysfs-driver-w1_therm    |   2 +-
 .../PCI/endpoint/function/binding/pci-test.rst     |  26 +
 .../PCI/endpoint/function/binding/pci-test.txt     |  19 -
 Documentation/PCI/endpoint/index.rst               |   2 +
 Documentation/PCI/endpoint/pci-endpoint-cfs.rst    |   2 +-
 Documentation/PCI/endpoint/pci-endpoint.rst        |   2 +-
 Documentation/PCI/pci-error-recovery.rst           |   2 +-
 Documentation/PCI/pci.rst                          |   8 +-
 Documentation/admin-guide/LSM/Yama.rst             |   7 +-
 Documentation/admin-guide/blockdev/drbd/index.rst  |   2 +-
 Documentation/admin-guide/blockdev/floppy.rst      |   6 +-
 Documentation/admin-guide/cgroup-v1/rdma.rst       |   2 +-
 Documentation/admin-guide/cgroup-v2.rst            |   8 +-
 Documentation/admin-guide/cifs/todo.rst            |   2 +-
 Documentation/admin-guide/cifs/usage.rst           |   7 +-
 Documentation/admin-guide/cifs/winucase_convert.pl |   2 +-
 Documentation/admin-guide/dell_rbu.rst             |   2 +-
 .../admin-guide/device-mapper/dm-integrity.rst     |   4 +-
 .../admin-guide/device-mapper/dm-raid.rst          |   2 +-
 .../admin-guide/device-mapper/dm-zoned.rst         |   2 +-
 Documentation/admin-guide/devices.txt              |   9 +-
 Documentation/admin-guide/ext4.rst                 |   4 +-
 .../special-register-buffer-data-sampling.rst      |   6 +-
 Documentation/admin-guide/index.rst                |   1 +
 Documentation/admin-guide/kernel-parameters.txt    |  20 +-
 .../admin-guide/laptops/disk-shock-protection.rst  |   2 +-
 Documentation/admin-guide/laptops/sonypi.rst       |   2 +-
 .../admin-guide/laptops/thinkpad-acpi.rst          |   6 +-
 Documentation/admin-guide/media/building.rst       |   4 +-
 Documentation/admin-guide/mm/concepts.rst          |   2 +-
 Documentation/admin-guide/mm/hugetlbpage.rst       |  23 +-
 Documentation/admin-guide/mm/index.rst             |   1 +
 Documentation/admin-guide/mm/ksm.rst               |   4 +-
 .../mm/nommu-mmap.rst}                             |   0
 Documentation/admin-guide/mm/numaperf.rst          |   2 +-
 Documentation/admin-guide/nfs/nfs-client.rst       |   4 +-
 Documentation/admin-guide/nfs/nfs-rdma.rst         |   2 +-
 Documentation/admin-guide/nfs/nfsroot.rst          |   6 +-
 .../admin-guide/nfs/pnfs-block-server.rst          |   2 +-
 Documentation/admin-guide/nfs/pnfs-scsi-server.rst |   2 +-
 Documentation/admin-guide/perf/arm-ccn.rst         |   2 +-
 .../admin-guide/pm/intel-speed-select.rst          |   4 +-
 Documentation/admin-guide/pm/intel_pstate.rst      |   2 +-
 Documentation/admin-guide/security-bugs.rst        |   9 +-
 Documentation/admin-guide/sysctl/fs.rst            |   2 +-
 Documentation/admin-guide/sysctl/kernel.rst        |  42 +-
 Documentation/admin-guide/sysctl/vm.rst            |   2 +-
 Documentation/admin-guide/tainted-kernels.rst      |   4 +-
 Documentation/admin-guide/xfs.rst                  |   2 +-
 Documentation/arm/booting.rst                      |   2 +-
 Documentation/arm64/acpi_object_usage.rst          |   2 +-
 Documentation/arm64/arm-acpi.rst                   |   4 +-
 Documentation/arm64/index.rst                      |   1 +
 Documentation/arm64/{perf.txt => perf.rst}         |   7 +-
 Documentation/arm64/sve.rst                        |   2 +-
 Documentation/block/biodoc.rst                     |   2 +-
 Documentation/block/blk-mq.rst                     | 153 ++++
 Documentation/block/index.rst                      |   1 +
 Documentation/block/pr.rst                         |   2 +-
 Documentation/bpf/bpf_devel_QA.rst                 |   1 +
 Documentation/bpf/index.rst                        |   8 +
 .../bus-virt-phys-mapping.rst}                     |   2 +-
 Documentation/core-api/cpu_hotplug.rst             |   4 +-
 Documentation/core-api/dma-api.rst                 |   6 +-
 Documentation/core-api/dma-isa-lpc.rst             |   2 +-
 Documentation/core-api/index.rst                   |   3 +
 Documentation/core-api/kobject.rst                 |   2 +-
 Documentation/core-api/memory-allocation.rst       |  44 ++
 Documentation/core-api/pin_user_pages.rst          |   2 +-
 Documentation/core-api/printk-basics.rst           |   2 +-
 Documentation/core-api/printk-formats.rst          |   4 +-
 .../this_cpu_ops.rst}                              |   0
 .../unaligned-memory-access.rst                    |   0
 .../crypto/{api-intro.txt => api-intro.rst}        | 186 ++---
 .../{asymmetric-keys.txt => asymmetric-keys.rst}   |  91 ++-
 .../crypto/{async-tx-api.txt => async-tx-api.rst}  | 255 ++++---
 .../{descore-readme.txt => descore-readme.rst}     | 152 ++--
 Documentation/crypto/index.rst                     |   5 +
 Documentation/dev-tools/coccinelle.rst             |  40 +-
 Documentation/dev-tools/gcov.rst                   |   4 +-
 Documentation/dev-tools/kgdb.rst                   |   2 +-
 Documentation/dev-tools/kmemleak.rst               |   2 -
 Documentation/dev-tools/sparse.rst                 |   6 +-
 ...oting-without-of.txt => booting-without-of.rst} | 302 ++++----
 Documentation/devicetree/index.rst                 |   1 +
 Documentation/driver-api/connector.rst             |   5 +-
 Documentation/driver-api/device-io.rst             |  22 +-
 Documentation/driver-api/dmaengine/client.rst      |   2 +-
 Documentation/driver-api/dmaengine/provider.rst    |   2 +-
 Documentation/driver-api/driver-model/driver.rst   |   2 -
 .../early-userspace/early_userspace_support.rst    |   4 +-
 Documentation/driver-api/i3c/protocol.rst          |   2 +-
 Documentation/driver-api/index.rst                 |   1 +
 Documentation/driver-api/ipmi.rst                  |   2 +-
 .../{mailbox.txt => driver-api/mailbox.rst}        |   0
 .../driver-api/memory-devices/ti-gpmc.rst          |   2 +-
 Documentation/driver-api/mmc/mmc-tools.rst         |   2 +-
 Documentation/driver-api/ntb.rst                   |   2 +-
 Documentation/driver-api/nvdimm/nvdimm.rst         |  14 +-
 Documentation/driver-api/nvdimm/security.rst       |   2 +-
 Documentation/driver-api/rapidio/rapidio.rst       |   4 +-
 .../driver-api/thermal/cpu-idle-cooling.rst        |  14 +-
 .../driver-api/thermal/nouveau_thermal.rst         |   2 +-
 Documentation/driver-api/usb/dma.rst               |   6 +-
 .../driver-api/usb/writing_usb_driver.rst          |   4 +-
 Documentation/fb/modedb.rst                        |   2 +-
 Documentation/features/debug/kcov/arch-support.txt |  33 +
 Documentation/features/debug/kgdb/arch-support.txt |   2 +-
 .../features/debug/kmemleak/arch-support.txt       |  33 +
 Documentation/filesystems/9p.rst                   |   2 +-
 Documentation/filesystems/afs.rst                  |   2 +-
 Documentation/filesystems/autofs-mount-control.rst |   6 +-
 Documentation/filesystems/caching/cachefiles.rst   |   2 +-
 Documentation/filesystems/caching/operations.rst   |   2 +-
 Documentation/filesystems/coda.rst                 |   4 +-
 Documentation/filesystems/configfs.rst             |   2 +-
 Documentation/filesystems/directory-locking.rst    |   4 +-
 Documentation/filesystems/f2fs.rst                 | 312 ++++----
 Documentation/filesystems/fsverity.rst             |   2 +-
 Documentation/filesystems/hfs.rst                  |   2 +-
 Documentation/filesystems/hpfs.rst                 |   2 +-
 Documentation/filesystems/locking.rst              |  12 +-
 Documentation/filesystems/mount_api.rst            |   4 +-
 Documentation/filesystems/nfs/rpc-server-gss.rst   |   6 +-
 Documentation/filesystems/omfs.rst                 |   2 +-
 Documentation/filesystems/overlayfs.rst            |   2 +-
 Documentation/filesystems/path-lookup.rst          |  32 +-
 Documentation/filesystems/proc.rst                 | 155 ++--
 .../filesystems/ramfs-rootfs-initramfs.rst         |   8 +-
 Documentation/filesystems/sysfs-pci.rst            |   2 +-
 Documentation/filesystems/sysfs-tagging.rst        |   2 +-
 Documentation/filesystems/ubifs-authentication.rst |   4 +-
 Documentation/filesystems/vfs.rst                  |  16 +-
 Documentation/fpga/dfl.rst                         |   2 +-
 Documentation/gpu/drm-mm.rst                       |   2 +-
 Documentation/gpu/drm-uapi.rst                     |   2 +-
 Documentation/gpu/komeda-kms.rst                   |   2 +-
 Documentation/hid/hiddev.rst                       |   2 +-
 Documentation/hid/intel-ish-hid.rst                |   2 +-
 Documentation/i2c/upgrading-clients.rst            |   2 +-
 Documentation/ia64/efirtc.rst                      |   2 +-
 Documentation/index.rst                            |  14 +
 Documentation/kbuild/kconfig-language.rst          |   2 +-
 Documentation/leds/ledtrig-transient.rst           |   2 +-
 Documentation/locking/mutex-design.rst             |   4 +-
 Documentation/locking/ww-mutex-design.rst          |   2 +-
 .../maintainer/maintainer-entry-profile.rst        |   2 +-
 Documentation/mips/ingenic-tcu.rst                 |   2 +-
 .../{ad525x_dpot.txt => ad525x_dpot.rst}           |  24 +-
 .../misc-devices/{apds990x.txt => apds990x.rst}    |  31 +-
 .../misc-devices/{bh1770glc.txt => bh1770glc.rst}  |  45 +-
 .../misc-devices/{c2port.txt => c2port.rst}        |  56 +-
 Documentation/misc-devices/index.rst               |   6 +
 Documentation/misc-devices/pci-endpoint-test.rst   |  56 ++
 Documentation/misc-devices/pci-endpoint-test.txt   |  41 -
 Documentation/misc-devices/spear-pcie-gadget.rst   | 170 +++++
 Documentation/misc-devices/spear-pcie-gadget.txt   | 130 ----
 Documentation/misc-devices/xilinx_sdfec.rst        |   2 +-
 Documentation/openrisc/openrisc_port.rst           |   2 +-
 Documentation/powerpc/index.rst                    |   1 +
 Documentation/powerpc/vas-api.rst                  |  25 +-
 ...pudispatch_stats.txt => vcpudispatch_stats.rst} |  17 +-
 Documentation/process/2.Process.rst                |  12 +-
 Documentation/process/4.Coding.rst                 |   4 +-
 Documentation/process/botching-up-ioctls.rst       |   2 +-
 Documentation/process/changes.rst                  |   6 +-
 Documentation/process/clang-format.rst             |   2 +-
 Documentation/process/coding-style.rst             |   2 +-
 Documentation/process/deprecated.rst               | 118 +++
 Documentation/process/howto.rst                    |   2 +-
 Documentation/process/index.rst                    |   4 +-
 Documentation/process/kernel-docs.rst              |  28 +-
 Documentation/process/maintainer-pgp-guide.rst     |   2 +-
 Documentation/process/submitting-drivers.rst       |  22 +-
 Documentation/process/submitting-patches.rst       |   9 +-
 Documentation/s390/monreader.rst                   |   2 +-
 Documentation/s390/vfio-ap.rst                     |   2 +-
 Documentation/security/credentials.rst             |  10 +-
 Documentation/security/keys/core.rst               |   2 +-
 Documentation/security/keys/trusted-encrypted.rst  |   2 +-
 Documentation/sh/index.rst                         |  18 +-
 .../sh/{new-machine.txt => new-machine.rst}        | 199 ++---
 .../sh/{register-banks.txt => register-banks.rst}  |  13 +-
 Documentation/sphinx/parse-headers.pl              |   2 +-
 Documentation/{crc32.txt => staging/crc32.rst}     |   0
 Documentation/staging/index.rst                    |  58 ++
 Documentation/{lzo.txt => staging/lzo.rst}         |   0
 .../{remoteproc.txt => staging/remoteproc.rst}     |   2 +-
 Documentation/{rpmsg.txt => staging/rpmsg.rst}     |   0
 .../{speculation.txt => staging/speculation.rst}   |   8 +-
 .../{static-keys.txt => staging/static-keys.rst}   |   0
 Documentation/{tee.txt => staging/tee.rst}         |  73 ++
 Documentation/{xz.txt => staging/xz.rst}           |   0
 Documentation/timers/no_hz.rst                     |   2 -
 Documentation/trace/ftrace.rst                     |  18 +-
 Documentation/trace/histogram-design.rst           |   4 +-
 Documentation/trace/index.rst                      |   3 +
 Documentation/{kprobes.txt => trace/kprobes.rst}   |  16 +-
 Documentation/trace/kprobetrace.rst                |   2 +-
 ...ng-buffer-design.txt => ring-buffer-design.rst} | 836 +++++++++++----------
 Documentation/trace/stm.rst                        |   4 +-
 .../translations/it_IT/core-api/index.rst          |  18 +
 .../it_IT/core-api/symbol-namespaces.rst           | 166 ++++
 Documentation/translations/it_IT/index.rst         |   5 +-
 .../translations/it_IT/kernel-hacking/hacking.rst  |   4 +-
 .../translations/it_IT/process/coding-style.rst    |   2 +-
 .../translations/ko_KR/memory-barriers.txt         |   6 +-
 .../zh_CN/admin-guide/clearing-warn-once.rst       |   9 +
 .../translations/zh_CN/admin-guide/cpu-load.rst    | 105 +++
 .../translations/zh_CN/admin-guide/index.rst       | 125 +++
 Documentation/translations/zh_CN/arm/Booting       |   2 +-
 .../translations/zh_CN/filesystems/sysfs.txt       |   6 +-
 Documentation/translations/zh_CN/index.rst         |   4 +
 .../translations/zh_CN/process/2.Process.rst       |   8 +-
 .../translations/zh_CN/process/4.Coding.rst        |   2 +-
 .../zh_CN/process/7.AdvancedTopics.rst             |   6 +-
 .../translations/zh_CN/process/8.Conclusion.rst    |  10 +-
 .../translations/zh_CN/process/coding-style.rst    |   2 +-
 Documentation/translations/zh_CN/process/howto.rst |  12 +-
 .../zh_CN/process/submitting-drivers.rst           |  18 +-
 .../zh_CN/process/submitting-patches.rst           |   4 +-
 .../zh_CN/process/volatile-considered-harmful.rst  |   4 +-
 Documentation/virt/kvm/amd-memory-encryption.rst   |   6 +-
 Documentation/virt/kvm/api.rst                     |  18 +-
 Documentation/virt/kvm/mmu.rst                     |   2 +-
 Documentation/virt/kvm/nested-vmx.rst              |   2 +-
 Documentation/virt/kvm/s390-pv.rst                 |   2 +-
 Documentation/vm/memory-model.rst                  |   2 +-
 Documentation/x86/earlyprintk.rst                  |   2 +-
 Documentation/x86/x86_64/machinecheck.rst          |   2 +-
 MAINTAINERS                                        |  22 +-
 arch/Kconfig                                       |   2 +-
 arch/ia64/hp/common/sba_iommu.c                    |  12 +-
 arch/parisc/kernel/pci-dma.c                       |   2 +-
 arch/sh/Kconfig.cpu                                |   2 +-
 arch/x86/include/asm/dma-mapping.h                 |   4 +-
 arch/x86/kernel/amd_gart_64.c                      |   2 +-
 crypto/asymmetric_keys/asymmetric_type.c           |   2 +-
 crypto/asymmetric_keys/public_key.c                |   2 +-
 crypto/asymmetric_keys/signature.c                 |   2 +-
 drivers/block/drbd/Kconfig                         |   2 +-
 drivers/md/Kconfig                                 |   8 +-
 drivers/md/dm-crypt.c                              |   2 +-
 drivers/misc/Kconfig                               |   2 +-
 drivers/misc/ad525x_dpot.c                         |   2 +-
 drivers/parisc/sba_iommu.c                         |  14 +-
 fs/cifs/cifsacl.c                                  |   4 +-
 fs/cifs/cifsglob.h                                 |   2 +-
 fs/cifs/winucase.c                                 |   2 +-
 include/crypto/public_key.h                        |   2 +-
 include/keys/asymmetric-parser.h                   |   2 +-
 include/keys/asymmetric-subtype.h                  |   2 +-
 include/keys/asymmetric-type.h                     |   2 +-
 include/linux/dma-mapping.h                        |   2 +-
 include/linux/fs.h                                 |   2 +-
 include/linux/jump_label.h                         |   2 +-
 include/linux/kcsan-checks.h                       |  10 +-
 include/linux/netdevice.h                          |   2 +
 include/linux/phylink.h                            |   4 +
 include/media/videobuf-dma-sg.h                    |   2 +-
 init/Kconfig                                       |   2 +-
 kernel/dma/debug.c                                 |   2 +-
 lib/crc32.c                                        |   2 +-
 lib/lzo/lzo1x_decompress_safe.c                    |   2 +-
 lib/xz/Kconfig                                     |   2 +-
 mm/Kconfig                                         |   2 +-
 mm/nommu.c                                         |   2 +-
 net/core/dev.c                                     |   1 +
 samples/kprobes/kprobe_example.c                   |   2 +-
 samples/kprobes/kretprobe_example.c                |   2 +-
 scripts/kernel-doc                                 |  30 +-
 scripts/sphinx-pre-install                         |   4 -
 tools/testing/selftests/vm/protection_keys.c       |   2 +-
 275 files changed, 3356 insertions(+), 1928 deletions(-)
 create mode 100644 Documentation/PCI/endpoint/function/binding/pci-test.rst
 delete mode 100644 Documentation/PCI/endpoint/function/binding/pci-test.txt
 rename Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} (100%)
 rename Documentation/arm64/{perf.txt => perf.rst} (95%)
 create mode 100644 Documentation/block/blk-mq.rst
 rename Documentation/{bus-virt-phys-mapping.txt => core-api/bus-virt-phys-mapping.rst} (99%)
 rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
 rename Documentation/{process => core-api}/unaligned-memory-access.rst (100%)
 rename Documentation/crypto/{api-intro.txt => api-intro.rst} (70%)
 rename Documentation/crypto/{asymmetric-keys.txt => asymmetric-keys.rst} (91%)
 rename Documentation/crypto/{async-tx-api.txt => async-tx-api.rst} (55%)
 rename Documentation/crypto/{descore-readme.txt => descore-readme.rst} (81%)
 rename Documentation/devicetree/{booting-without-of.txt => booting-without-of.rst} (90%)
 rename Documentation/{mailbox.txt => driver-api/mailbox.rst} (100%)
 create mode 100644 Documentation/features/debug/kcov/arch-support.txt
 create mode 100644 Documentation/features/debug/kmemleak/arch-support.txt
 rename Documentation/misc-devices/{ad525x_dpot.txt => ad525x_dpot.rst} (85%)
 rename Documentation/misc-devices/{apds990x.txt => apds990x.rst} (86%)
 rename Documentation/misc-devices/{bh1770glc.txt => bh1770glc.rst} (83%)
 rename Documentation/misc-devices/{c2port.txt => c2port.rst} (61%)
 create mode 100644 Documentation/misc-devices/pci-endpoint-test.rst
 delete mode 100644 Documentation/misc-devices/pci-endpoint-test.txt
 create mode 100644 Documentation/misc-devices/spear-pcie-gadget.rst
 delete mode 100644 Documentation/misc-devices/spear-pcie-gadget.txt
 rename Documentation/powerpc/{vcpudispatch_stats.txt => vcpudispatch_stats.rst} (94%)
 rename Documentation/sh/{new-machine.txt => new-machine.rst} (73%)
 rename Documentation/sh/{register-banks.txt => register-banks.rst} (88%)
 rename Documentation/{crc32.txt => staging/crc32.rst} (100%)
 create mode 100644 Documentation/staging/index.rst
 rename Documentation/{lzo.txt => staging/lzo.rst} (100%)
 rename Documentation/{remoteproc.txt => staging/remoteproc.rst} (99%)
 rename Documentation/{rpmsg.txt => staging/rpmsg.rst} (100%)
 rename Documentation/{speculation.txt => staging/speculation.rst} (97%)
 rename Documentation/{static-keys.txt => staging/static-keys.rst} (100%)
 rename Documentation/{tee.txt => staging/tee.rst} (80%)
 rename Documentation/{xz.txt => staging/xz.rst} (100%)
 rename Documentation/{kprobes.txt => trace/kprobes.rst} (99%)
 rename Documentation/trace/{ring-buffer-design.txt => ring-buffer-design.rst} (55%)
 create mode 100644 Documentation/translations/it_IT/core-api/index.rst
 create mode 100644 Documentation/translations/it_IT/core-api/symbol-namespaces.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/clearing-warn-once.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/cpu-load.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/index.rst
