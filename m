Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB9C197113
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2020 01:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgC2X1Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 29 Mar 2020 19:27:16 -0400
Received: from ms.lwn.net ([45.79.88.28]:60332 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgC2X1P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 29 Mar 2020 19:27:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A45BE2F3;
        Sun, 29 Mar 2020 23:27:14 +0000 (UTC)
Date:   Sun, 29 Mar 2020 17:27:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 5.7
Message-ID: <20200329172713.206afe79@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit
adc10f5b0a03606e30c704cff1f0283a696d0260:

  docs: Fix empty parallelism argument (2020-02-25 03:11:04 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-5.7

for you to fetch changes up to abcb1e021ae5a36374c635eeaba5cec733169b78:

  Documentation: x86: exception-tables: document CONFIG_BUILDTIME_TABLE_SORT (2020-03-27 10:50:01 -0600)

----------------------------------------------------------------
This has been a busy cycle for documentation work.  Highlights include:

  - Lots of RST conversion work by Mauro, Daniel ALmeida, and others.
    Maybe someday we'll get to the end of this stuff...maybe...

  - Some organizational work to bring some order to the core-api manual.

  - Various new docs and additions to the existing documentation.

  - Typo fixes, warning fixes, ...

One result of all this is that there are rather more than the usual number
of annoying merge conflicts in store here.  Everybody pokes their fingers
into Documentation/ (necessarily, IMO, not complaining), so conflicts are
going to happen.  The resolutions are all pretty obvious, but I'll happily
make a merged branch if you wish.

----------------------------------------------------------------
Alex Hung (1):
      Documentation: fix a typo for intel_iommu=nobounce

Alexandre Belloni (1):
      docs: userspace: ioctl-number: remove mc146818rtc conflict

Alexandre Ghiti (1):
      documentation: vm: Advertise support for pte_special in riscv

Bhaskar Chowdhury (1):
      Replace dead urls with active urls for Mutt

Daniel W. S. Almeida (5):
      Documentation: nfs: convert pnfs.txt to ReST
      Documentation: nfs: rpc-cache: convert to ReST
      Documentation: nfs: rpc-server-gss: convert to ReST
      Documentation: nfs: nfs41-server: convert to ReST
      Documentation: nfs: knfsd-stats: convert to ReST

Guilherme G. Piccoli (1):
      Documentation: Better document the softlockup_panic sysctl

Jakub Kicinski (5):
      doc: cgroup: improve formatting
      doc: cgroup: improve formatting of mem stats
      doc: cgroup: improve formatting of io example
      doc: cgroup: improve formatting of cpuset examples
      doc: cgroup: improve formatting of references

Jonathan Corbet (8):
      Merge tag 'docs-5.6-fixes' into docs-next
      Merge branch 'mauro' into docs-next
      docs: Organize core-api/index.rst
      docs: move gcc-plugins to the kbuild manual
      docs: move core-api/ioctl.rst to driver-api/
      docs: Remove :c:func: from process/deprecated.rst
      docs: fix reference to core-api/namespaces.rst
      Merge branch 'mauro' into docs-next

Jonathan Neuschäfer (14):
      docs: arm: tcm: Fix a few typos
      docs: Fix path to MTD command line partition parser
      docs: driver-api: edid: Fix list formatting
      docs: admin-guide: Move edid.rst from driver-api
      docs: admin-guide: edid: Clarify where to run "make"
      tools/edid: Move EDID data sets from Documentation/
      docs: dev-tools: gcov: Remove a stray single-quote
      docs: admin-guide: kernel-parameters: Document earlycon options for i.MX UARTs
      docs: kernel-docs: Remove "Here is its" at the end of lines
      docs: Move Intel Many Integrated Core documentation (mic) under misc-devices
      docs: admin-guide: binfmt-misc: Improve the title
      docs: it_IT: netdev-FAQ: Fix link to original document
      docs: dev-tools: kmemleak: Update list of architectures
      Documentation: management-style: Fix formatting of emphsized word

Kees Cook (3):
      docs: deprecated.rst: Add %p to the list
      docs: deprecated.rst: Clean up fall-through details
      docs: deprecated.rst: Add BUG()-family

Lukas Bulwahn (2):
      MAINTAINERS: adjust to kobject doc ReST conversion
      MAINTAINERS: adjust to filesystem doc ReST conversion

Manivannan Sadhasivam (1):
      docs: kref: Clarify the use of two kref_put() in example code

Mauro Carvalho Chehab (55):
      scripts: documentation-file-ref-check: improve :doc: handling
      docs: gpu: i915.rst: fix warnings due to file renames
      docs: filesystems: convert 9p.txt to ReST
      docs: filesystems: convert adfs.txt to ReST
      docs: filesystems: convert affs.txt to ReST
      docs: filesystems: convert afs.txt to ReST
      docs: filesystems: convert autofs-mount-control.txt to ReST
      docs: filesystems: convert befs.txt to ReST
      docs: filesystems: convert bfs.txt to ReST
      docs: filesystems: convert btrfs.txt to ReST
      docs: filesystems: convert ceph.txt to ReST
      docs: filesystems: convert cramfs.txt to ReST
      docs: filesystems: convert debugfs.txt to ReST
      docs: filesystems: convert dlmfs.txt to ReST
      docs: filesystems: convert ecryptfs.txt to ReST
      docs: filesystems: convert efivarfs.txt to ReST
      docs: filesystems: convert erofs.txt to ReST
      docs: filesystems: convert ext2.txt to ReST
      docs: filesystems: convert ext3.txt to ReST
      docs: filesystems: convert f2fs.txt to ReST
      docs: filesystems: convert gfs2.txt to ReST
      docs: filesystems: convert gfs2-uevents.txt to ReST
      docs: filesystems: convert hfsplus.txt to ReST
      docs: filesystems: convert hfs.txt to ReST
      docs: filesystems: convert hpfs.txt to ReST
      docs: filesystems: convert inotify.txt to ReST
      docs: filesystems: convert isofs.txt to ReST
      docs: filesystems: convert nilfs2.txt to ReST
      docs: filesystems: convert ntfs.txt to ReST
      docs: filesystems: convert ocfs2-online-filecheck.txt to ReST
      docs: filesystems: convert ocfs2.txt to ReST
      docs: filesystems: convert omfs.txt to ReST
      docs: filesystems: convert orangefs.txt to ReST
      docs: filesystems: convert proc.txt to ReST
      docs: filesystems: convert qnx6.txt to ReST
      docs: filesystems: convert ramfs-rootfs-initramfs.txt to ReST
      docs: filesystems: convert relay.txt to ReST
      docs: filesystems: convert romfs.txt to ReST
      docs: filesystems: convert squashfs.txt to ReST
      docs: filesystems: convert sysfs.txt to ReST
      docs: filesystems: convert sysv-fs.txt to ReST
      docs: filesystems: convert tmpfs.txt to ReST
      docs: filesystems: convert ubifs-authentication.rst.txt to ReST
      docs: filesystems: convert ubifs.txt to ReST
      docs: filesystems: convert udf.txt to ReST
      docs: filesystems: convert zonefs.txt to ReST
      docs: trace: events.rst: convert some new stuff to ReST format
      docs: driver.rst: supress two ReSt warnings
      docs: translations: it: avoid duplicate refs at programming-language.rst
      docs: filesystems: fuse.rst: supress a Sphinx warning
      docs: perf: imx-ddr.rst: get rid of a warning
      docs: hw-vuln: tsx_async_abort.rst: get rid of an unused ref
      docs: fix pointers to io-mapping.rst and io_ordering.rst files
      docs: prevent warnings due to autosectionlabel
      docs: conf.py: avoid thousands of duplicate label warning on Sphinx

Michael Ellerman (1):
      docs/core-api: Add Fedora instructions for GCC plugins

Nick Desaulniers (1):
      Documentation: x86: exception-tables: document CONFIG_BUILDTIME_TABLE_SORT

Niklas Söderlund (1):
      Documentation: nfsroot.rst: Fix references to nfsroot.rst

Pragat Pandya (2):
      Documentation: Add io-mapping.rst to driver-api manual
      Documentation: Add io_ordering.rst to driver-api manual

Randy Dunlap (2):
      Documentation: bootconfig: fix Sphinx block warning
      Documentation: sort _SPHINXDIRS for 'make help'

Sameer Rahmani (2):
      Documentation: Converted the `kobject.txt` to rst format
      Documentation: kobject.txt has been moved to core-api/kobject.rst

Stephen Boyd (2):
      docs: locking: Add 'need' to hardirq section
      docs: locking: Drop :c:func: throughout

Stephen Kitt (9):
      docs: pretty up sysctl/kernel.rst
      docs: merge debugging-modules.txt into sysctl/kernel.rst
      docs: drop l2cr from sysctl/kernel.rst
      docs: add missing IPC documentation in sysctl/kernel.rst
      docs: document stop-a in sysctl/kernel.rst
      docs: document panic fully in sysctl/kernel.rst
      docs: sysctl/kernel: remove rtsig entries
      docs: sysctl/kernel: document acpi_video_flags
      docs: add a script to check sysctl docs

Tim Bird (1):
      scripts/sphinx-pre-install: add '-p python3' to virtualenv

Tony Fischetti (1):
      Documentation: bring process docs up to date

Wang Long (1):
      Documentation/ABI: move sysfs-kernel-uids to removed directory

Wang Wenhu (2):
      doc: zh_CN: index files in filesystems subdirectory
      doc: zh_CN: add translation for virtiofs

Yue Hu (1):
      Documentation: zram: fix the description about orig_data_size of mm_stat

Zenghui Yu (1):
      Documentation: kthread: Fix WQ_SYSFS workqueues path name

d.hatayama@fujitsu.com (1):
      docs: admin-guide: Add description of %c corename format

 .../ABI/{testing => removed}/sysfs-kernel-uids     |    2 +-
 Documentation/Makefile                             |    2 +-
 Documentation/PCI/pci.rst                          |    2 +-
 Documentation/accounting/psi.rst                   |    2 +
 Documentation/admin-guide/binfmt-misc.rst          |    4 +-
 Documentation/admin-guide/blockdev/zram.rst        |    2 -
 Documentation/admin-guide/bootconfig.rst           |    2 +-
 Documentation/admin-guide/cgroup-v1/index.rst      |    2 +
 Documentation/admin-guide/cgroup-v2.rst            |   28 +-
 Documentation/{driver-api => admin-guide}/edid.rst |    4 +-
 .../admin-guide/hw-vuln/tsx_async_abort.rst        |    2 -
 Documentation/admin-guide/index.rst                |    1 +
 Documentation/admin-guide/kernel-parameters.txt    |   26 +-
 .../admin-guide/kernel-per-CPU-kthreads.rst        |    2 +-
 Documentation/admin-guide/perf/imx-ddr.rst         |    3 +-
 Documentation/admin-guide/sysctl/kernel.rst        | 1049 ++++++-------
 Documentation/arm/tcm.rst                          |    6 +-
 Documentation/conf.py                              |    6 +-
 Documentation/core-api/index.rst                   |   94 +-
 .../{kobject.txt => core-api/kobject.rst}          |   78 +-
 Documentation/debugging-modules.txt                |   22 -
 Documentation/dev-tools/gcov.rst                   |    2 +-
 Documentation/dev-tools/kmemleak.rst               |    3 +-
 .../driver-api/80211/mac80211-advanced.rst         |    8 +-
 Documentation/driver-api/dmaengine/index.rst       |    4 +-
 Documentation/driver-api/driver-model/driver.rst   |    2 +-
 Documentation/driver-api/index.rst                 |    4 +-
 .../{io-mapping.txt => driver-api/io-mapping.rst}  |    0
 .../io_ordering.rst}                               |    0
 Documentation/{core-api => driver-api}/ioctl.rst   |    0
 .../features/vm/pte_special/arch-support.txt       |    2 +-
 Documentation/filesystems/{9p.txt => 9p.rst}       |  114 +-
 Documentation/filesystems/{adfs.txt => adfs.rst}   |   29 +-
 Documentation/filesystems/{affs.txt => affs.rst}   |   62 +-
 Documentation/filesystems/{afs.txt => afs.rst}     |   73 +-
 ...-mount-control.txt => autofs-mount-control.rst} |  108 +-
 Documentation/filesystems/{befs.txt => befs.rst}   |   59 +-
 Documentation/filesystems/{bfs.txt => bfs.rst}     |   37 +-
 Documentation/filesystems/{btrfs.txt => btrfs.rst} |    3 +
 Documentation/filesystems/{ceph.txt => ceph.rst}   |   26 +-
 Documentation/filesystems/cifs/cifsroot.txt        |    2 +-
 .../filesystems/{cramfs.txt => cramfs.rst}         |   19 +-
 .../filesystems/{debugfs.txt => debugfs.rst}       |   54 +-
 Documentation/filesystems/{dlmfs.txt => dlmfs.rst} |   28 +-
 .../filesystems/{ecryptfs.txt => ecryptfs.rst}     |   51 +-
 .../filesystems/{efivarfs.txt => efivarfs.rst}     |    5 +-
 Documentation/filesystems/{erofs.txt => erofs.rst} |  177 ++-
 Documentation/filesystems/{ext2.txt => ext2.rst}   |   41 +-
 Documentation/filesystems/{ext3.txt => ext3.rst}   |    2 +
 Documentation/filesystems/{f2fs.txt => f2fs.rst}   |  254 ++--
 Documentation/filesystems/fuse.rst                 |    5 +-
 .../{gfs2-uevents.txt => gfs2-uevents.rst}         |   20 +-
 Documentation/filesystems/{gfs2.txt => gfs2.rst}   |   20 +-
 Documentation/filesystems/{hfs.txt => hfs.rst}     |   23 +-
 .../filesystems/{hfsplus.txt => hfsplus.rst}       |    2 +
 Documentation/filesystems/{hpfs.txt => hpfs.rst}   |  239 +--
 Documentation/filesystems/index.rst                |   47 +
 .../filesystems/{inotify.txt => inotify.rst}       |   33 +-
 Documentation/filesystems/isofs.rst                |   64 +
 Documentation/filesystems/isofs.txt                |   48 -
 Documentation/filesystems/nfs/index.rst            |   13 +
 .../nfs/{knfsd-stats.txt => knfsd-stats.rst}       |   17 +-
 Documentation/filesystems/nfs/nfs41-server.rst     |  256 ++++
 Documentation/filesystems/nfs/nfs41-server.txt     |  173 ---
 .../filesystems/nfs/{pnfs.txt => pnfs.rst}         |   25 +-
 .../nfs/{rpc-cache.txt => rpc-cache.rst}           |  136 +-
 .../nfs/{rpc-server-gss.txt => rpc-server-gss.rst} |   19 +-
 .../filesystems/{nilfs2.txt => nilfs2.rst}         |   40 +-
 Documentation/filesystems/{ntfs.txt => ntfs.rst}   |  145 +-
 ...ne-filecheck.txt => ocfs2-online-filecheck.rst} |   45 +-
 Documentation/filesystems/{ocfs2.txt => ocfs2.rst} |   31 +-
 Documentation/filesystems/omfs.rst                 |  112 ++
 Documentation/filesystems/omfs.txt                 |  106 --
 .../filesystems/{orangefs.txt => orangefs.rst}     |  187 ++-
 Documentation/filesystems/{proc.txt => proc.rst}   | 1544 +++++++++++---------
 Documentation/filesystems/{qnx6.txt => qnx6.rst}   |   22 +
 ...fs-initramfs.txt => ramfs-rootfs-initramfs.rst} |   54 +-
 Documentation/filesystems/{relay.txt => relay.rst} |  139 +-
 Documentation/filesystems/{romfs.txt => romfs.rst} |   42 +-
 .../filesystems/{squashfs.txt => squashfs.rst}     |   60 +-
 Documentation/filesystems/{sysfs.txt => sysfs.rst} |  324 ++--
 .../filesystems/{sysv-fs.txt => sysv-fs.rst}       |  153 +-
 Documentation/filesystems/{tmpfs.txt => tmpfs.rst} |   44 +-
 Documentation/filesystems/ubifs-authentication.rst |   10 +-
 Documentation/filesystems/{ubifs.txt => ubifs.rst} |   25 +-
 Documentation/filesystems/{udf.txt => udf.rst}     |   21 +-
 Documentation/filesystems/virtiofs.rst             |    2 +
 .../filesystems/{zonefs.txt => zonefs.rst}         |  108 +-
 Documentation/gpu/i915.rst                         |    4 +-
 Documentation/index.rst                            |    1 -
 Documentation/{core-api => kbuild}/gcc-plugins.rst |    4 +
 Documentation/kbuild/index.rst                     |    1 +
 Documentation/kernel-hacking/hacking.rst           |    4 +-
 Documentation/kernel-hacking/locking.rst           |  176 +--
 Documentation/kref.txt                             |    4 +
 Documentation/media/kapi/v4l2-controls.rst         |    8 +-
 Documentation/misc-devices/index.rst               |    1 +
 Documentation/{ => misc-devices}/mic/index.rst     |    0
 .../{ => misc-devices}/mic/mic_overview.rst        |    0
 .../{ => misc-devices}/mic/scif_overview.rst       |    0
 Documentation/networking/snmp_counter.rst          |    4 +-
 Documentation/powerpc/ultravisor.rst               |    4 +-
 Documentation/process/2.Process.rst                |  108 +-
 Documentation/process/coding-style.rst             |   18 +-
 Documentation/process/deprecated.rst               |  120 +-
 Documentation/process/email-clients.rst            |    4 +-
 Documentation/process/howto.rst                    |   17 +-
 Documentation/process/kernel-docs.rst              |   10 +-
 Documentation/process/management-style.rst         |    2 +-
 Documentation/security/siphash.rst                 |    8 +-
 Documentation/target/tcmu-design.rst               |    6 +-
 Documentation/trace/events.rst                     |   63 +-
 .../translations/it_IT/networking/netdev-FAQ.rst   |    2 +-
 .../it_IT/process/programming-language.rst         |   30 +-
 .../translations/zh_CN/filesystems/index.rst       |   27 +
 .../translations/zh_CN/filesystems/virtiofs.rst    |   58 +
 Documentation/translations/zh_CN/index.rst         |    1 +
 Documentation/translations/zh_CN/io_ordering.txt   |    4 +-
 .../translations/zh_CN/process/5.Posting.rst       |    2 +-
 Documentation/userspace-api/ioctl/ioctl-number.rst |    1 -
 Documentation/x86/exception-tables.rst             |   14 +
 Documentation/x86/intel-iommu.rst                  |    3 +-
 MAINTAINERS                                        |   66 +-
 arch/unicore32/include/asm/io.h                    |    2 +-
 fs/nfs/Kconfig                                     |    2 +-
 include/linux/io-mapping.h                         |    2 +-
 net/ipv4/Kconfig                                   |    6 +-
 net/ipv4/ipconfig.c                                |    2 +-
 scripts/check-sysctl-docs                          |  181 +++
 scripts/documentation-file-ref-check               |   11 +-
 scripts/gcc-plugins/Kconfig                        |    2 +-
 scripts/sphinx-pre-install                         |   17 +-
 {Documentation/EDID => tools/edid}/1024x768.S      |    0
 {Documentation/EDID => tools/edid}/1280x1024.S     |    0
 {Documentation/EDID => tools/edid}/1600x1200.S     |    0
 {Documentation/EDID => tools/edid}/1680x1050.S     |    0
 {Documentation/EDID => tools/edid}/1920x1080.S     |    0
 {Documentation/EDID => tools/edid}/800x600.S       |    0
 {Documentation/EDID => tools/edid}/Makefile        |    0
 {Documentation/EDID => tools/edid}/edid.S          |    0
 {Documentation/EDID => tools/edid}/hex             |    0
 141 files changed, 4570 insertions(+), 3292 deletions(-)
 rename Documentation/ABI/{testing => removed}/sysfs-kernel-uids (91%)
 rename Documentation/{driver-api => admin-guide}/edid.rst (98%)
 rename Documentation/{kobject.txt => core-api/kobject.rst} (87%)
 delete mode 100644 Documentation/debugging-modules.txt
 rename Documentation/{io-mapping.txt => driver-api/io-mapping.rst} (100%)
 rename Documentation/{io_ordering.txt => driver-api/io_ordering.rst} (100%)
 rename Documentation/{core-api => driver-api}/ioctl.rst (100%)
 rename Documentation/filesystems/{9p.txt => 9p.rst} (63%)
 rename Documentation/filesystems/{adfs.txt => adfs.rst} (85%)
 rename Documentation/filesystems/{affs.txt => affs.rst} (86%)
 rename Documentation/filesystems/{afs.txt => afs.rst} (90%)
 rename Documentation/filesystems/{autofs-mount-control.txt => autofs-mount-control.rst} (89%)
 rename Documentation/filesystems/{befs.txt => befs.rst} (83%)
 rename Documentation/filesystems/{bfs.txt => bfs.rst} (71%)
 rename Documentation/filesystems/{btrfs.txt => btrfs.rst} (96%)
 rename Documentation/filesystems/{ceph.txt => ceph.rst} (91%)
 rename Documentation/filesystems/{cramfs.txt => cramfs.rst} (88%)
 rename Documentation/filesystems/{debugfs.txt => debugfs.rst} (91%)
 rename Documentation/filesystems/{dlmfs.txt => dlmfs.rst} (86%)
 rename Documentation/filesystems/{ecryptfs.txt => ecryptfs.rst} (62%)
 rename Documentation/filesystems/{efivarfs.txt => efivarfs.rst} (85%)
 rename Documentation/filesystems/{erofs.txt => erofs.rst} (54%)
 rename Documentation/filesystems/{ext2.txt => ext2.rst} (91%)
 rename Documentation/filesystems/{ext3.txt => ext3.rst} (88%)
 rename Documentation/filesystems/{f2fs.txt => f2fs.rst} (84%)
 rename Documentation/filesystems/{gfs2-uevents.txt => gfs2-uevents.rst} (94%)
 rename Documentation/filesystems/{gfs2.txt => gfs2.rst} (76%)
 rename Documentation/filesystems/{hfs.txt => hfs.rst} (80%)
 rename Documentation/filesystems/{hfsplus.txt => hfsplus.rst} (95%)
 rename Documentation/filesystems/{hpfs.txt => hpfs.rst} (66%)
 rename Documentation/filesystems/{inotify.txt => inotify.rst} (83%)
 create mode 100644 Documentation/filesystems/isofs.rst
 delete mode 100644 Documentation/filesystems/isofs.txt
 create mode 100644 Documentation/filesystems/nfs/index.rst
 rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)
 create mode 100644 Documentation/filesystems/nfs/nfs41-server.rst
 delete mode 100644 Documentation/filesystems/nfs/nfs41-server.txt
 rename Documentation/filesystems/nfs/{pnfs.txt => pnfs.rst} (87%)
 rename Documentation/filesystems/nfs/{rpc-cache.txt => rpc-cache.rst} (66%)
 rename Documentation/filesystems/nfs/{rpc-server-gss.txt => rpc-server-gss.rst} (92%)
 rename Documentation/filesystems/{nilfs2.txt => nilfs2.rst} (89%)
 rename Documentation/filesystems/{ntfs.txt => ntfs.rst} (85%)
 rename Documentation/filesystems/{ocfs2-online-filecheck.txt => ocfs2-online-filecheck.rst} (77%)
 rename Documentation/filesystems/{ocfs2.txt => ocfs2.rst} (88%)
 create mode 100644 Documentation/filesystems/omfs.rst
 delete mode 100644 Documentation/filesystems/omfs.txt
 rename Documentation/filesystems/{orangefs.txt => orangefs.rst} (83%)
 rename Documentation/filesystems/{proc.txt => proc.rst} (65%)
 rename Documentation/filesystems/{qnx6.txt => qnx6.rst} (98%)
 rename Documentation/filesystems/{ramfs-rootfs-initramfs.txt => ramfs-rootfs-initramfs.rst} (91%)
 rename Documentation/filesystems/{relay.txt => relay.rst} (91%)
 rename Documentation/filesystems/{romfs.txt => romfs.rst} (86%)
 rename Documentation/filesystems/{squashfs.txt => squashfs.rst} (91%)
 rename Documentation/filesystems/{sysfs.txt => sysfs.rst} (56%)
 rename Documentation/filesystems/{sysv-fs.txt => sysv-fs.rst} (73%)
 rename Documentation/filesystems/{tmpfs.txt => tmpfs.rst} (86%)
 rename Documentation/filesystems/{ubifs.txt => ubifs.rst} (91%)
 rename Documentation/filesystems/{udf.txt => udf.rst} (83%)
 rename Documentation/filesystems/{zonefs.txt => zonefs.rst} (90%)
 rename Documentation/{core-api => kbuild}/gcc-plugins.rst (98%)
 rename Documentation/{ => misc-devices}/mic/index.rst (100%)
 rename Documentation/{ => misc-devices}/mic/mic_overview.rst (100%)
 rename Documentation/{ => misc-devices}/mic/scif_overview.rst (100%)
 create mode 100644 Documentation/translations/zh_CN/filesystems/index.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/virtiofs.rst
 create mode 100755 scripts/check-sysctl-docs
 rename {Documentation/EDID => tools/edid}/1024x768.S (100%)
 rename {Documentation/EDID => tools/edid}/1280x1024.S (100%)
 rename {Documentation/EDID => tools/edid}/1600x1200.S (100%)
 rename {Documentation/EDID => tools/edid}/1680x1050.S (100%)
 rename {Documentation/EDID => tools/edid}/1920x1080.S (100%)
 rename {Documentation/EDID => tools/edid}/800x600.S (100%)
 rename {Documentation/EDID => tools/edid}/Makefile (100%)
 rename {Documentation/EDID => tools/edid}/edid.S (100%)
 rename {Documentation/EDID => tools/edid}/hex (100%)
